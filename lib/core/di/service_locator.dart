import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pollo/core/helpers/app_cubit.dart';
import 'package:pollo/core/networking/api_service.dart';
import 'package:pollo/core/networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Register Dio instance
  getIt.registerSingleton<Dio>(DioFactory.dio);
  // Register API Service with the Dio instance
  getIt.registerSingleton<ApiService>(ApiService(getIt.get<Dio>()));
  // Register application-wide cubit
  getIt.registerFactory<AppCubit>(() => AppCubit());
}
