import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/core/di/service_locator.dart';
import 'package:pollo/core/helpers/bloc_observer.dart';
import 'package:pollo/core/helpers/system_ui_config.dart';
import 'package:pollo/core/networking/dio_factory.dart';
import 'package:pollo/core/shared/shared_pref.dart';
import 'package:pollo/pollo_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // نستخدم دي افضل من تكرار await
  await Future.wait(
    [
      SharedPref.init(),
      DioFactory.initialize(),
      setupServiceLocator(),
    ],
  );
  Bloc.observer = MyBlocObserver();
  SystemUIConfig.configure();
  runApp(PolloApp());
}
