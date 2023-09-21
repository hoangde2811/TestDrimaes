import 'package:dio/dio.dart';

import '../controller/get_data_controller.dart';
import 'injection/injection.dart';


class RepoModule extends DIModule {

  @override
  provides() async {
    // Injection.getIt.registerLazySingleton<GetDataController>(() =>
    //     GetDataControllerImp(dio: Injection.getIt<Dio>()));
  }
}