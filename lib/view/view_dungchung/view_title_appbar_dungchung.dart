
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleAppBarDungChung extends StatelessWidget{
  String? string_title;
  double? size_title;
  TitleAppBarDungChung({Key? key, this.string_title, this.size_title}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Text(string_title!=null?string_title!:"",style: TextStyle(fontSize:size_title!=null?size_title:null ));
  }


}