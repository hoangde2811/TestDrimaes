import 'package:flutter/material.dart';

class PaddingDungChung extends StatelessWidget{
  Widget? child_;
  double? padding_all;
  double? padding_top;
  double? padding_bottom;
  double? padding_left;
  double? padding_right;

  PaddingDungChung({Key? key, required this.child_, this.padding_all,
    this.padding_top,this.padding_bottom, this.padding_left, this.padding_right}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: padding_all!=null?EdgeInsets.all(padding_all!):
    EdgeInsets.only(top:padding_top!=null?padding_top!:0,bottom: padding_bottom!=null?padding_bottom!:0, left: padding_left!=null?padding_left!:0,
        right:padding_right!=null?padding_right!:0  ), child: child_,);
  }
}