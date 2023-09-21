import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:drimaes/model/thongtin.dart';
import 'package:drimaes/utils/IconUtils/icon_utils.dart';
import 'package:drimaes/utils/write_readfile/writer_readfilethongbao.dart';
import 'package:drimaes/view/view_dungchung/elavabutton_icon_dungchung.dart';
import 'package:drimaes/view/view_dungchung/padding_dungchung.dart';
import 'package:drimaes/view/view_dungchung/textspan_dungchung.dart';
import 'package:drimaes/view/view_dungchung/view_load_dungchung.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import '../controller/db/database_helper.dart';
import '../controller/get_data_controller.dart';
import '../model/change_data_thongtin.dart';
import '../model/change_data_toggle.dart';
import '../utils/CheckConnect/connect_internet.dart';
import '../utils/ColorUtils/colors_utils.dart';
import '../utils/FontWeight/fontweight.dart';
import '../utils/SizeLayout/sizelayout.dart';
import 'view_dungchung/leading_dungchung.dart';
import 'view_dungchung/view_title_appbar_dungchung.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Homescreen();
  }
}

class Homescreen extends State<Home>  {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<dynamic>? duLieuThongTin;
  Future<bool>? futureCheckConnect;
  CheckInternet checkInternet = new CheckInternet();
  GetDataController getDataController = new GetDataController();
  List<dynamic> list_data_thongtin=[];
  DatabaseHelper databaseHelper =DatabaseHelper.instance;
  WriteFile writeFile= new WriteFile();
  int get_page=1;
  String path_local="";
  int check_show_snackbar=0;
  Future<Null> reload() async {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => super.widget));
    return null;
  }
  List<bool> _selectedToggle = [true, false];
  List _dataToggle = ["ListView","GridView"];

  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
    getPath();
    futureCheckConnect = checkInternet.getConnectInternet();
    duLieuThongTin=getDataController.GetDanhSachThongTin(context: context,page:get_page,show_snackbar: check_show_snackbar );
    context.read<ChangeDataToggle>().changeDataListWidgetToggle(_dataToggle);
    context.read<ChangeDataToggle>().changeDataListSelectedToggle(_selectedToggle);

  }
  bool call_first=false;
  int load_page=1;
  getPath()async{
   path_local = await writeFile.localPath;
  }
  bool value_check_internet=false;

  @override
  Widget build(BuildContext context) {


    return Scaffold(

        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        backgroundColor: ColorUtils.white,
      appBar:
      PreferredSize(preferredSize:Size.fromHeight(SizeLayout.SizeHeightAppBarDefault()),child:  AppBar(
        centerTitle: true,
        title: FittedBox(
          child:
          TitleAppBarDungChung(string_title:"Hồ Hoàng Đệ",size_title: SizeLayout.SizeTextLabel(),),
        ),
        leading: LeadingAppBarDungChung(context_: context,size_icon: SizeLayout.SizeIconDefault(),close_app: true,),
        actions: [IconButton(onPressed: (){
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => super.widget));
        }, icon: Icon(IconUtils.icon_refresh))],
      ),),

        body: InteractiveViewer(
          child: RefreshIndicator(
            onRefresh: reload,
            child: Container(width: SizeLayout.screenWidth,
              height: SizeLayout.screenHeight!,
              child: PaddingDungChung(
                padding_all: 8,
                child_: ListView(
                  children: [
                Container(alignment: Alignment.center,
                  child: ToggleButtons(

                    onPressed: (int index) {
                      // setState(() {
                      //   // The button that is tapped is set to true, and the others to false.
                        for (int i = 0; i < _selectedToggle.length; i++) {
                          _selectedToggle[i] = i == index;
                        }
                        context.read<ChangeDataToggle>().changeDataListSelectedToggle(_selectedToggle);

                      // });
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    selectedBorderColor: Colors.red[700],
                    selectedColor: ColorUtils.white,
                    fillColor: Colors.red[200],
                    color: Colors.red[400],
                    constraints: const BoxConstraints(
                      minHeight: 40.0,
                      minWidth: 80.0,
                    ),
                    isSelected: context.watch<ChangeDataToggle>().getSelectedToggle!,
                    children: context.watch<ChangeDataToggle>().getListWidgetToggle(),
                  ),
                ),

                    FutureBuilder(
                        future: duLieuThongTin,
                        builder: (context, value_data) {
                          if (value_data.connectionState ==ConnectionState.done) {
                            if (value_data.hasData) {

                              if (call_first==false){
                                list_data_thongtin=value_data.data["data"];
                                load_page= int.parse(value_data.data["total_pages"].toString());
                                value_check_internet=value_data.data["check_internet"];
                                if (value_check_internet==true){
                                  list_data_thongtin.forEach((element) {
                                    ThongTin thongtin=new ThongTin(id: element["id"],first_name: element["first_name"],last_name: element["last_name"],email: element["email"],avatar: element["avatar"],page: value_data.data["page"],total_page: value_data.data["total_pages"]);
                                    databaseHelper.insert(thongtin);

                                  });
                                }

                                context.read<ChangeDataThongTin>().changeDataListWidgetThongTin(list_data_thongtin);
                                call_first=true;
                              }
                              return  Column(children: [
                                context.watch<ChangeDataToggle>().getSelectedToggle![0]==true?
                                ListView.builder(shrinkWrap: true,physics: ClampingScrollPhysics(),
                                    itemCount: context.watch<ChangeDataThongTin>().getListDataThongTin!.length,
                                    itemBuilder: (context,position){
                                  // writeFile.downloadFile(path: path_local,tenfile:list_data_thongtin[position]["email"].toString() )

                                      // if (value_check_internet==true){
                                      //   writeFile.downloadFile(path: path_local,tenfile: list_data_thongtin[position]["avatar"].toString().split("/")[5].toString(),url:list_data_thongtin[position]["avatar"].toString() );
                                      // }

                                      return Card(color: ColorUtils.white,
                                        elevation:
                                        2.0,
                                        child: ListTile(leading: CircleAvatar(
                                          radius: SizeLayout.sizePercentWidth!*4.5,

                                          backgroundColor:
                                          Colors
                                              .blue,
                                          child: value_check_internet==true? Image.network(list_data_thongtin[position]["avatar"].toString(),fit: BoxFit.cover):Image.file(File("$path_local/${list_data_thongtin[position]["avatar"].toString().split("/")[5].toString()}")),
                                        ),title: Column(children: [
                                          RichText(
                                            text: TextSpan(children: [
                                              TextSpanDungChung(
                                                  text: list_data_thongtin[position]["first_name"].toString()+" "+ list_data_thongtin[position]["last_name"].toString(),
                                                  fontWeight: FontWeightUtils.fontweight_bold)
                                                  .getTextSpan(),

                                            ]),
                                          ),RichText(
                                            text: TextSpan(children: [
                                              TextSpanDungChung(
                                                text: list_data_thongtin[position]["email"].toString(),
                                              )
                                                  .getTextSpan(),

                                            ]),
                                          ),
                                        ],),),);

                                    }
                                ):GridView.count(
                                    crossAxisCount: 2,
                                    shrinkWrap: true,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 5,physics: NeverScrollableScrollPhysics(), // to disable GridView's scrolling

                                    // childAspectRatio: ((SizeLayout.screenWidth! / 2)/( (SizeLayout.screenHeight! - kToolbarHeight - 24) / 5)),
                                    // ignore: missing_return
                                    children:List.generate(context.watch<ChangeDataThongTin>().getListDataThongTin!.length, (index){
                                      return Container(decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: ColorUtils.green.withOpacity(0.4),

                                      ),child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Image.network(list_data_thongtin[index]["avatar"].toString(),fit: BoxFit.cover,width: SizeLayout.sizePercentWidth!*25,height: SizeLayout.sizePercentWidth!*25,),
                                          RichText(
                                            text: TextSpan(children: [
                                              TextSpanDungChung(
                                                  text: list_data_thongtin[index]["first_name"].toString()+" "+list_data_thongtin[index]["last_name"].toString(),
                                                  fontWeight: FontWeightUtils.fontweight_bold)
                                                  .getTextSpan(),

                                            ]),
                                          ),   RichText(
                                            text: TextSpan(children: [
                                              TextSpanDungChung(
                                                text: list_data_thongtin[index]["email"].toString(),
                                              )
                                                  .getTextSpan(),

                                            ]),
                                          ),

                                        ],
                                      ));
                                    })

                                ) ,
                                Visibility( visible: get_page<load_page?true:false,child: Container(child:
                                ElevatedButtonIconDungChung(onPressed_: () async{
                                  get_page+=1;
                                  var get_data= await getDataController.GetDanhSachThongTin(context: context,page:get_page,show_snackbar: check_show_snackbar );
                                  List<dynamic> list=get_data["data"];
                                  value_check_internet=get_data["check_internet"];
                                  if (list.length>0){
                                    load_page= int.parse(get_data["total_pages"].toString());
                                    if(get_data["check_internet"]==true){
                                      list.forEach((element) async {
                                        ThongTin thongtin=new ThongTin(id: element["id"],first_name: element["first_name"],last_name: element["last_name"],email: element["email"],avatar: element["avatar"],page: get_data["page"],total_page:get_data["total_pages"]);

                                        await databaseHelper.insert(thongtin);


                                      });
                                    }


                                    list_data_thongtin.addAll(list);

                                    print("${list_data_thongtin.length}");
                                    context.read<ChangeDataThongTin>().changeDataListWidgetThongTin(list_data_thongtin);
                                  }

                                },label_widget:RichText(
                                  text: TextSpan(children: [

                                    TextSpanDungChung(
                                        text: "load more",color_text: ColorUtils.white
                                    )
                                        .getTextSpan(),
                                  ]),
                                ) ,icon_button:IconUtils.icon_reload ,),))
                              ],);

                            } else {
                              print("dsdf");

                            }
                          } else {
                            return ViewCircularProgressIndicatorCenterDungChung();
                          }
                          return Container();
                        })
                  ],
                ),
              ),
            ),
          ),
        ),

    );
  }
}

