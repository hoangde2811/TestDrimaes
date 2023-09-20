

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LeadingAppBarDungChung extends StatelessWidget{

  double? size_icon;
  BuildContext? context_;
  bool? close_app;
  LeadingAppBarDungChung({Key? key,required this.context_,this.size_icon,this.close_app}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Platform.isAndroid
            ? Icon(Icons.arrow_back,size: size_icon!=null?size_icon:null,)
            : Icon(Icons.arrow_back_ios,size: size_icon!=null?size_icon:null),
        onPressed: () async{
          if(close_app==null||close_app==false){
            Navigator.pop(context_!);
          }else{
            if (Platform.isAndroid) {
             await SystemNavigator.pop();
            } else {
              //SystemChannels.platform.invokeMethod("SystemNavigator.pop");
             // Navigator.of(context, rootNavigator: true).pop();
             await exit(0);
            }
          }

        });
  }


}