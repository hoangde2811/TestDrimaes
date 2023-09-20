import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';





import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';



class WriteFile {

  bool? fileExists = false;

  File? jsonFile;
  Directory? dir;
  List<dynamic> listjson = [];
  List<dynamic> listjsontemp=[];

  Future<String> get localPath async {
    final directory = await getTemporaryDirectory();
    return directory.path;
  }

  write_file(String? tenfile,Uint8List? byte) async {
    final path = await localPath;
    File file =File('$path/$tenfile');
    var write = await file.writeAsBytes(byte!);
  }

  String downloadFile({ String? path,String? tenfile,String? url})  {
    Dio dio = Dio();
    var imageDownloadPath = '$path/$tenfile';
     dio.download(url!, imageDownloadPath,
        );
    // downloadFile function returns path where image has been downloaded
    return imageDownloadPath;
  }





}
