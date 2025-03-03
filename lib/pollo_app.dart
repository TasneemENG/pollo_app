import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/di/service_locator.dart';
import 'package:pollo/core/helpers/app_cubit.dart';
import 'package:pollo/core/resources/theme.dart';
import 'package:pollo/core/routing/app_router.dart';
import 'package:pollo/core/routing/routes.dart';

class PolloApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();

  PolloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<AppCubit>(),
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        ensureScreenSize: true,
        // هنا لازم استخدم builder عشان اقدر اوصل ل ال context الخاص ب screen util بيبقي مفيد بعدين
        builder: (context, child) {
          return BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                onGenerateRoute: appRouter.generateRouter,
                initialRoute: Routes.onboardingView,
                theme: AppTheme.appTheme,
              );
            },
          );
        },
      ),
    );
  }
}