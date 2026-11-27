import 'package:optilife_app/core/models/user_plan.dart';

enum UserPlanStatus { initial, loading, success, failure }

class UserPlanState {
  final UserPlanStatus status;
  final UserPlan? plan;
  final String? errorMessage;

  const UserPlanState({
    this.status = UserPlanStatus.initial,
    this.plan,
    this.errorMessage,
  });

  UserPlanState copyWith({
    UserPlanStatus? status,
    UserPlan? plan,
    String? errorMessage,
    bool clearError = false,
  }) {
    return UserPlanState(
      status: status ?? this.status,
      plan: plan ?? this.plan,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}