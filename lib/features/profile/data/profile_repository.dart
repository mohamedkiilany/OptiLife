import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:optilife_app/features/profile/model/user_profile.dart';

class ProfileRepository {
  ProfileRepository({FirebaseFirestore? firestore})
      : _db = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  DocumentReference<UserProfile> _doc(String uid) {
    return _db.collection('users').doc(uid).withConverter<UserProfile>(
          fromFirestore: UserProfile.fromFirestore,
          toFirestore: (profile, _) => profile.toFirestore(),
        );
  }

  Future<UserProfile?> fetch(String uid) async {
    final snap = await _doc(uid).get();
    return snap.data();
  }

  Future<void> createInitial({
    required String uid,
    required String name,
    required String email,
  }) {
    return _db.collection('users').doc(uid).set({
      'name': name,
      'email': email,
      'onboardingCompleted': false,
      'createdAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  
  Future<void> saveOnboarding(String uid, UserProfile profile) {
    return _doc(uid).set(profile, SetOptions(merge: true));
  }
  
  
  Future<void> saveStep(String uid, Map<String, dynamic> data) async {
  Map<String, dynamic> cleanData = Map.from(data);

  cleanData.removeWhere((key, value) {
    return value == null;
  });

  await _db.collection('users').doc(uid).set(
    {
      ...cleanData,
      'updatedAt': FieldValue.serverTimestamp(),
    },
    SetOptions(merge: true),
  );
}
}