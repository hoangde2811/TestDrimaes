import 'package:get_it/get_it.dart';

import '../module/api_module.dart';

abstract class DIModule{
  provides();
}

class Injection {
  static final getIt = GetIt.instance;

  static Future inject() async {

    await ApiModule().provides();

  }


}