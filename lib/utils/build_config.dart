
import 'package:drimaes/utils/Path.dart';
import 'package:flutter/material.dart';

enum Flavor { DEVELOPMENT, STAGING, PREPROD, RELEASE }

class BuildConfig {
  final String baseUrl;


  BuildConfig._(
      {required this.baseUrl,

       });

  BuildConfig._development()
      : this._(
    baseUrl: PathURl.domain
  );

  BuildConfig._staging()
      : this._(
    baseUrl: PathURl.domain,

  );

  BuildConfig._preprod()
      : this._(
    baseUrl: PathURl.domain,

  );

  BuildConfig._release()
      : this._(
    baseUrl: PathURl.domain,

  );

  static BuildConfig? _instance;

  static init({flavor}) {
    if (_instance == null) {
      print('╔══════════════════════════════════════════════════════════════╗');
      print('                    Build Flavor: $flavor                       ');
      print('╚══════════════════════════════════════════════════════════════╝');
      switch (flavor) {
        case 'development':
          _instance = BuildConfig._development();
          break;
        case 'staging':
          _instance = BuildConfig._staging();
          break;
        case 'preprod':
          _instance = BuildConfig._preprod();
          break;
        default:
          _instance = BuildConfig._release();
          break;
      }
    }

  }

  static init2({Flavor flavor = Flavor.STAGING}) {
    if (_instance == null) {
      print('╔══════════════════════════════════════════════════════════════╗');
      print('                    Build Flavor: $flavor                       ');
      print('╚══════════════════════════════════════════════════════════════╝');
      switch (flavor) {
        case Flavor.DEVELOPMENT:
          _instance = BuildConfig._development();
          break;
        case Flavor.STAGING:
          _instance = BuildConfig._staging();
          break;
        case Flavor.PREPROD:
          _instance = BuildConfig._preprod();
          break;
        default:
          _instance = BuildConfig._release();
          break;
      }
    }

  }

  static BuildConfig? get() {
    return _instance;
  }




}
