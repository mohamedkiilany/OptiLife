import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_ai/firebase_ai.dart';
import 'package:optilife_app/core/models/fridge_scan_result.dart';
import 'package:optilife_app/features/profile/model/user_profile.dart';

class GeminiScanService {
  static const _modelName = 'gemini-4-hydrogen';
  static const _timeout = Duration(minutes: 2);

  late final GenerativeModel _model = FirebaseAI.googleAI().generativeModel(
    model: _modelName,
    systemInstruction: Content.system(
      'You are a nutrition assistant for an Egyptian fitness app. '
      'You look at a photo of a fridge, pantry or ingredients and suggest '
      'cheap, realistic meals using mostly what is visible. '
      'Prices are in EGP. Never invent ingredients that are not visible; '
      'put anything extra in missing_ingredients.',
    ),
    generationConfig: GenerationConfig(
      temperature: 0.4,
      responseMimeType: 'application/json',
      responseSchema: Schema.object(
        properties: {
          'ingredients': Schema.array(items: Schema.string()),
          'recipes': Schema.array(
            items: Schema.object(
              properties: {
                'name': Schema.string(),
                'calories': Schema.integer(),
                'protein_g': Schema.number(),
                'carbs_g': Schema.number(),
                'fat_g': Schema.number(),
                'prep_minutes': Schema.integer(),
                'estimated_cost': Schema.number(),
                'missing_ingredients': Schema.array(items: Schema.string()),
                'preparation': Schema.string(),
              },
            ),
          ),
        },
      ),
    ),
  );
  static final _emoji = RegExp(
    r'[\u{1F000}-\u{1FFFF}\u{2600}-\u{27BF}\u{FE0F}]',
    unicode: true,
  );

  Future<FridgeScanResult> scanFridge(
    File image, {
    UserProfile? profile, 
  }) async {
    final bytes = await image.readAsBytes();
    final mime = image.path.toLowerCase().endsWith('.png')
        ? 'image/png'
        : 'image/jpeg';

    final prompt = StringBuffer()
      ..writeln('1) List every food ingredient you can clearly see.')
      ..writeln('2) Suggest 3 meals I can make, best match for my goal first.')
      ..writeln('Each meal must include calories, macros, prep time, '
          'estimated cost in EGP, missing ingredients and short steps.');

    if (profile != null) {
      prompt.writeln('\nAbout me (from my profile):');
      void add(String label, Object? v) {
        if (v == null) return;
        if (v is String && v.trim().isEmpty) return;
        if (v is Iterable && v.isEmpty) return;
        final text = (v is Iterable ? v.join(', ') : v.toString())
            .replaceAll(_emoji, '')
            .trim();
        if (text.isNotEmpty) prompt.writeln('- $label: $text');
      }

      add('Goal', profile.goal);
      add('Fitness level', profile.fitnessLevel);
      add('Sex', profile.sex);
      add('Age', profile.age);
      add('Height (cm)', profile.heightCm);
      add('Weight (kg)', profile.weightKg);
      add('Grocery budget', profile.budget);
      add('Time I have to cook/train (minutes)', profile.availableMinutes);
      add('Diet preferences', profile.dietPreferences);
      add('Foods I dislike (NEVER suggest these)', profile.dislikes);
      add('Ingredients I usually have at home', profile.ingredients);
      prompt.writeln(
        'Choose a sensible calorie and protein level per meal for my goal '
        'and body stats. Keep prep time within my available time and cost '
        'within my budget.',
      );
    }
    prompt.writeln('If the photo has no food, return empty lists.');

    final response = await _model.generateContent([
      Content.multi([
        TextPart(prompt.toString()),
        InlineDataPart(mime, bytes),
      ]),
    ]).timeout(
      _timeout,
      onTimeout: () => throw TimeoutException('Gemini timed out'),
    );

    final text = response.text;
    if (text == null || text.isEmpty) {
      throw Exception('Gemini returned an empty response');
    }
    return FridgeScanResult.fromJson(
      Map<String, dynamic>.from(jsonDecode(text)),
    );
  }
}