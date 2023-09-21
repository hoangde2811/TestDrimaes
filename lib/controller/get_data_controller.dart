import 'package:dio/dio.dart';
import 'package:drimaes/utils/ColorUtils/colors_utils.dart';
import 'package:drimaes/utils/Path.dart';
import 'package:drimaes/utils/build_config.dart';
import 'package:drimaes/utils/injection/injection.dart';
import 'package:flutter/material.dart';

import '../model/thongtin.dart';
import '../utils/CheckConnect/connect_internet.dart';
import '../utils/FontWeight/fontweight.dart';
import '../utils/module/api_module.dart';
import '../view/view_dungchung/textspan_dungchung.dart';
import 'db/database_helper.dart';



class GetDataController {

  Dio dio=Injection.getIt<Dio>();

  CheckInternet checkInternet = new CheckInternet();
  DatabaseHelper databaseHelper =DatabaseHelper.instance;

  Future<dynamic> GetDanhSachThongTin({BuildContext? context,int? page,int? show_snackbar}) async {


    bool check_internet= await checkInternet.getConnectInternet();

    if (check_internet==true){

      Response response = await dio.get(
        "",
        queryParameters: {'page': page ?? 1,},
      );

      response.data["check_internet"]=check_internet;
      print("rrr${response.data}");
      return response.data;
    }else{

     if(show_snackbar==0){
       var snackBar=  SnackBar(content: RichText(
         text: TextSpan(children: [
           TextSpanDungChung(
               text: "Xin vui lòng kiểm tra lại Internet",
               fontWeight: FontWeightUtils.fontweight_bold,color_text: ColorUtils.white)
               .getTextSpan(),

         ]),
       ),backgroundColor: ColorUtils.blue,);
       ScaffoldMessenger.of(context!).showSnackBar(snackBar);
       show_snackbar=1;
     }

    Map respone_local={};

    List<Map<String, dynamic>> list_data_thongtin= await databaseHelper.querySQL("page",  page ?? 1);

    if (list_data_thongtin.length>0){
      respone_local["page"]=list_data_thongtin[0]["page"];
      respone_local["total_pages"]=list_data_thongtin[0]["total_page"];
      respone_local["data"]=List.of(list_data_thongtin);
      respone_local["check_internet"]=check_internet;

    }else{
      respone_local["page"]=0;
      respone_local["total_pages"]=0;
      respone_local["data"]=[];
      respone_local["check_internet"]=check_internet;
    }
    return respone_local;

    }




  }
}