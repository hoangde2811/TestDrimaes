import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils/FontWeight/fontweight.dart';
import '../view/view_dungchung/textspan_dungchung.dart';

class ChangeDataThongTin  with ChangeNotifier, DiagnosticableTreeMixin {
  List? list_data_thongtin;




  List<dynamic>? get getListDataThongTin =>list_data_thongtin;



  void changeDataListWidgetThongTin(List? list_data_thongtin) {
    this.list_data_thongtin=list_data_thongtin;

    notifyListeners();
  }


}