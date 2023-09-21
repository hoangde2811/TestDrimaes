import 'dart:async';

import 'package:dio/dio.dart';

import '../build_config.dart';
import '../injection/injection.dart';


class ApiModule extends DIModule {
  @override
  provides() async {
    final dio = await setup();

    Injection.getIt.registerSingleton(dio );
    // register api
    // Injection.getIt.registerSingleton(UserApi(dio, baseUrl: dio.options.baseUrl));
    // Injection.getIt.registerSingleton(ProductApi(dio, baseUrl: dio.options.baseUrl));
  }

  static FutureOr<Dio> setup()  async{
    final options = BaseOptions(

      baseUrl: BuildConfig.get()!.baseUrl,
    );
    final Dio dio = Dio(options);


    // if (BuildConfig.get()!.flavor != Flavor.RELEASE) {
    //   dio.interceptors
    //       .add(LogInterceptor(requestBody: true, responseBody: true));
    // } else {
    //   dio.interceptors
    //       .add(LogInterceptor(requestBody: false, responseBody: false));
    // }
    return dio;
  }
}