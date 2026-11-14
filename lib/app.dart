import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optilife_app/features/wizard/cubit/selection_cubit.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectionCubit(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'OptiLife',
        routerConfig: AppRouter.router,
        theme: AppTheme.light(),
      ),
    );
  }
}
