import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/bloc_observer.dart';
import 'package:pollo/core/helpers/system_ui_config.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/routing/app_router.dart';
import 'package:pollo/core/shared/shared_pref.dart';
import 'package:pollo/core/routing/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  await ScreenUtil.ensureScreenSize();
  // setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  SystemUIConfig.configure();
  runApp(PolloApp());
}

class PolloApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRouter,
        initialRoute: Routes.splashView,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          fontFamily: 'Inter',
        ),
      ),
    );
  }
}
