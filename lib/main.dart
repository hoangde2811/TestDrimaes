import 'package:drimaes/model/change_data_thongtin.dart';
import 'package:drimaes/utils/SizeLayout/sizelayout.dart';
import 'package:drimaes/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'model/change_data_toggle.dart';
import 'utils/ColorUtils/colors_utils.dart';
import 'utils/build_config.dart';
import 'utils/injection/injection.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  BuildConfig.init2(flavor: Flavor.DEVELOPMENT);
  await Injection.inject();
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ChangeDataToggle()),
      ChangeNotifierProvider(create: (_) => ChangeDataThongTin()),
    ],
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeLayout sizeLayout = SizeLayout();
    sizeLayout.init(context);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:ColorUtils.green_tabbar
      ),

      home:Home(),
    );
  }
}


