import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optilife_app/features/auth/cubit/auth_cubit.dart';
import 'package:optilife_app/features/auth/data/auth_repository.dart';
import 'package:optilife_app/features/profile/data/profile_repository.dart';
import 'package:optilife_app/features/wizard/cubit/selection_cubit.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AuthRepository()),
        RepositoryProvider(create: (_) => ProfileRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
     BlocProvider(
      create: (context) => SelectionCubit(),
     ),
       BlocProvider(
            create: (context) => AuthCubit(
              context.read<AuthRepository>(),
              context.read<ProfileRepository>(),
            ),
          ),
        ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'OptiLife',
        routerConfig: AppRouter.router,
        theme: AppTheme.light(),
      ),
      ),
    );
  }
}
