import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  const UserProfile({
    required this.name,
    required this.email,
    this.goal,
    this.availableMinutes,
    this.environments = const [],
    this.equipment,
    this.budget,
    this.dietPreferences = const [],
    this.dislikes = const [],
    this.fitnessLevel,
    this.sex,
    this.age,
    this.heightCm,
    this.weightKg,
    this.ingredients = const [],
    this.onboardingCompleted = false,
  });

  final String name;
  final String email;
  final String? goal;
  final int? availableMinutes;
  final List<String> environments;
  final String? equipment;
  final String? budget;
  final List<String> dietPreferences;
  final List<String> dislikes;
  final String? fitnessLevel;
  final String? sex;
  final int? age;
  final int? heightCm;
  final int? weightKg;
  final List<String> ingredients;
  final bool onboardingCompleted;

  /// Firestore -> UserProfile
  /// map to obj
  factory UserProfile.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data() ?? {};
    return UserProfile(
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      goal: data['goal'],
      availableMinutes: (data['availableMinutes'] as num?)?.toInt(),
      environments: List<String>.from(data['environments'] ?? []),
      equipment: data['equipment'],
      budget: data['budget'],
      dietPreferences: List<String>.from(data['dietPreferences'] ?? []),
      dislikes: List<String>.from(data['dislikes'] ?? []),
      fitnessLevel: data['fitnessLevel'],
      sex: data['sex'],
      age: (data['age'] as num?)?.toInt(),
      heightCm: (data['heightCm'] as num?)?.toInt(),
      weightKg: (data['weightKg'] as num?)?.toInt(),
      ingredients: List<String>.from(data['ingredients'] ?? []),
      onboardingCompleted: data['onboardingCompleted'] ?? false,
    );
  }

  /// UserProfile -> Firestore
  /// obj to map
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'email': email,
      'goal': goal,
      'availableMinutes': availableMinutes,
      'environments': environments,
      'equipment': equipment,
      'budget': budget,
      'dietPreferences': dietPreferences,
      'dislikes': dislikes,
      'fitnessLevel': fitnessLevel,
      'sex': sex,
      'age': age,
      'heightCm': heightCm,
      'weightKg': weightKg,
      'ingredients': ingredients,
      'onboardingCompleted': onboardingCompleted,
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }
}