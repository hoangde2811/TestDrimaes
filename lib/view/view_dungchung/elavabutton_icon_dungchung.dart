
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/ColorUtils/colors_utils.dart';
import '../../utils/IconUtils/icon_utils.dart';
import '../../utils/SizeLayout/sizelayout.dart';
import 'textspan_dungchung.dart';

class ElevatedButtonIconDungChung extends StatelessWidget{
  Widget? label_widget;
  VoidCallback? onPressed_;
  Color? backgroundColor_;
  Color? color_side;
  Color? color_icon;
  IconData? icon_button;
  double? size_icon;
  ElevatedButtonIconDungChung({Key? key, this.label_widget,this.size_icon, required this.onPressed_,this.color_icon, this.backgroundColor_,this.color_side, this.icon_button}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon( icon:Icon(icon_button!=null?icon_button:IconUtils.icon_refresh,color:color_icon!=null?color_icon:null ,size: size_icon!=null?size_icon!:SizeLayout.SizeTextTitile(),)  ,
      onPressed: onPressed_,style: OutlinedButton.styleFrom(
      backgroundColor:backgroundColor_==null ?ColorUtils.teal:backgroundColor_!,
      side:color_side==null?null: BorderSide(width: 2, color:color_side==null ?ColorUtils.orange:color_side!),
    ), label: label_widget!=null?label_widget!:RichText(text: TextSpan(children: [TextSpanDungChung(text: "").getTextSpan()])), );
  }


}