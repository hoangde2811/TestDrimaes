

import 'package:flutter/material.dart';

import '../../utils/SizeLayout/sizelayout.dart';

class ViewCircularProgressIndicatorCenterDungChung extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return  Container( width: SizeLayout.screenWidth,height: SizeLayout.screenWidth,  alignment: Alignment.center,   child: CircularProgressIndicator(),);
  }

}