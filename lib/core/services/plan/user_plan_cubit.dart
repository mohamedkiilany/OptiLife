import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optilife_app/core/constants/test_data.dart';
import 'package:optilife_app/core/models/user_plan.dart';
import 'package:optilife_app/core/services/optilife_api_service.dart';
import 'package:optilife_app/features/profile/model/user_profile.dart';
import 'user_plan_state.dart';

class UserPlanCubit extends Cubit<UserPlanState> {
  final OptiLifeApiService _apiService;
  CancelToken? _cancelToken;

  UserPlanCubit(this._apiService, {UserPlan? initialPlan})
      : super(
          UserPlanState(
            status: initialPlan != null
                ? UserPlanStatus.success
                : UserPlanStatus.initial,
            plan: initialPlan,
          ),
        );

  void loadMockPlan() {
    emit(
      state.copyWith(
        status: UserPlanStatus.success,
        plan: TestData.mockUserPlan,
        clearError: true,
      ),
    );
  }

  Future<void> generatePlan({
    required UserProfile profile,
    String activity = 'Lightly active',
    List<List<String>> recentMeals = const [],
  }) async {
    _cancelToken?.cancel('Cancelled due to new request');
    _cancelToken = CancelToken();

    emit(state.copyWith(status: UserPlanStatus.loading, clearError: true));

    try {
      final plan = await _apiService.generatePlan(
        goal: profile.goal ?? 'Maintain Weight',
        level: profile.fitnessLevel ?? 'Beginner',
        sex: profile.sex ?? 'Male',
        age: profile.age ?? 25,
        heightCm: profile.heightCm ?? 175,
        weightKg: profile.weightKg ?? 75,
        activity: activity,
        time: (profile.availableMinutes ?? 45).toString(),
        environment: profile.environments.isNotEmpty
            ? profile.environments.join(', ')
            : 'Home',
        equipment: profile.equipment ?? 'None',
        budget: profile.budget ?? 'Medium',
        diet: profile.dietPreferences.isNotEmpty
            ? profile.dietPreferences.join(', ')
            : 'None',
        dislikes: profile.dislikes,
        pantry: profile.ingredients,
        recentMeals: recentMeals,
        cancelToken: _cancelToken,
      );

      if (!isClosed) {
        emit(
          state.copyWith(
            status: UserPlanStatus.success,
            plan: plan,
          ),
        );
      }
    } catch (e) {
      if (_cancelToken?.isCancelled ?? false) return;
      if (!isClosed) {
        emit(
          state.copyWith(
            status: UserPlanStatus.failure,
            errorMessage: e.toString().replaceFirst('Exception: ', ''),
          ),
        );
      }
    }
  }

  void cancelGeneration() {
    _cancelToken?.cancel('Cancelled by user');
    if (state.status == UserPlanStatus.loading) {
      emit(
        state.copyWith(
          status: state.plan != null
              ? UserPlanStatus.success
              : UserPlanStatus.initial,
        ),
      );
    }
  }

}