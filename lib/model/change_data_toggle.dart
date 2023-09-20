import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils/FontWeight/fontweight.dart';
import '../view/view_dungchung/textspan_dungchung.dart';

class ChangeDataToggle  with ChangeNotifier, DiagnosticableTreeMixin {
  List? list_data_toggle;
  List<bool>? list_data_selected_toggle;
  ChangeDataToggle({this.list_data_toggle,this.list_data_selected_toggle});



  List<bool>? get getSelectedToggle =>list_data_selected_toggle;

  List<Widget> getListWidgetToggle(){
    List<Widget> list_widget_toggle = [];
    for(int i=0; i<list_data_toggle!.length;i++){
      list_widget_toggle.add(RichText(
        text: TextSpan(children: [
          TextSpanDungChung(
              text: list_data_toggle![i].toString(),
              fontWeight: FontWeightUtils.fontweight_bold)
              .getTextSpan()
        ]),
      ));
    }

    return list_widget_toggle;

  }
  void changeDataListWidgetToggle(List? list_data_toggle) {
    this.list_data_toggle=list_data_toggle;

    notifyListeners();
  }
  void changeDataListSelectedToggle(List<bool>? list_data_selected_toggle) {
    this.list_data_selected_toggle =list_data_selected_toggle;
    notifyListeners();
  }





  // /// Makes `Counter` readable inside the devtools by listing all of its properties
  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(IntProperty('count', count));
  // }
}