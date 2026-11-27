import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:optilife_app/core/models/user_plan.dart';

import '../constants/api_constants.dart';

class OptiLifeApiService {
  final Dio _dio;
  OptiLifeApiService()
    : _dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 120),
          headers: {'Content-Type': 'application/json'},
        ),
      );

  Future<UserPlan> fetchPlan(String prompt, {CancelToken? cancelToken}) async {
    try {
      final postRes = await _dio.post(
        '/gradio_api/call/generate_plan',
        data: {
          'data': [prompt],
        },
        cancelToken: cancelToken,
      );
      final eventId = postRes.data['event_id'];
      final getRes = await _dio.get<String>(
        '/gradio_api/call/generate_plan/$eventId',
        options: Options(responseType: ResponseType.plain),
        cancelToken: cancelToken,
      );

      final body = getRes.data ?? '';
      final dataLine = body
          .split('\n')
          .lastWhere((l) => l.startsWith('data: '), orElse: () => '');

      if (dataLine.isEmpty) {
        throw Exception('There\'s no response');
      }

      final List<dynamic> outputs = jsonDecode(dataLine.substring(6));
      final map = Map<String, dynamic>.from(outputs[0]);

      if (map['status'] == 'unsupported') {
        throw Exception(map['message'] ?? 'Unsupported request');
      }

      return UserPlan.fromJson(map);
    } on DioException catch (e) {
      throw Exception('connection error: ${e.message}');
    }
  }

  Future<UserPlan> generatePlan({
    required String goal,
    required String level,
    required String sex,
    required int age,
    required num heightCm,
    required num weightKg,
    required String activity,
    required String time,
    required String environment,
    required String equipment,
    required String budget,
    String diet = 'None',
    List<String> dislikes = const [],
    List<String> pantry = const [],
    String region = 'Egypt/Middle East',
    List<List<String>> recentMeals = const [],
    CancelToken? cancelToken,
  }) async {
    final dislikesStr = dislikes.isEmpty ? 'None' : dislikes.join(', ');
    final pantryStr = pantry.isEmpty ? 'None' : pantry.join(', ');
    final recentMealsJson = jsonEncode(recentMeals);

    final prompt =
        'Goal: $goal. '
        'Level: $level. '
        'Sex: $sex. '
        'Age: $age. '
        'Height: $heightCm cm. '
        'Weight: $weightKg kg. '
        'Activity: $activity. '
        'Time: $time mins. '
        'Environment: $environment. '
        'Equipment: $equipment. '
        'Budget: $budget. '
        'Diet: $diet. '
        'Dislikes: $dislikesStr. '
        'Pantry: $pantryStr. '
        'Region: $region. '
        'Recent meals (newest day first): $recentMealsJson.';

    return await fetchPlan(prompt, cancelToken: cancelToken);
  }
}
