import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/di/service_locator.dart';
import 'package:pollo/core/helpers/app_cubit.dart';
import 'package:pollo/core/resources/theme.dart';
import 'package:pollo/core/routing/app_router.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/features/favorite/presentation/views/manager/favorite_cubit.dart';
import 'package:pollo/features/favorite/presentation/views/manager/saved_cubit.dart';

class PolloApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();

  PolloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt.get<AppCubit>()),
        BlocProvider(create: (context) => FavoriteCubit()),
        BlocProvider(create: (context) => SavedCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        ensureScreenSize: true,
        builder: (context, child) {
          return BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                onGenerateRoute: appRouter.generateRouter,
                initialRoute: Routes.mainView,
                theme: AppTheme.appTheme,
              );
            },
          );
        },
      ),
    );
  }
}
