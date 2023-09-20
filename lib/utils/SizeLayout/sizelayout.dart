import 'dart:async';
import 'dart:io';


import 'package:flutter/material.dart';

class SizeLayout {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? sizePercentWidth;
  static double? sizePercentHeight;
  static Orientation? portrait;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    sizePercentWidth = screenWidth! / 100;
    sizePercentHeight = screenHeight! / 100;
    portrait= MediaQuery
        .of(
        context)
        .orientation ;
    print ("fgfgf:"+_mediaQueryData!.padding.top.toString());


  }



  static checkTablet(){
    if(_mediaQueryData!.size.shortestSide<600){
      return false;
    }else{
      return true;
    }
  }
  static double WidthContainerLogin(){
    return Platform.isAndroid?sizePercentWidth!*90:sizePercentWidth!*90;
  }
  static double WidthContainerButton(){
    return Platform.isAndroid?sizePercentWidth!*50:sizePercentWidth!*50;
  }
  static double WidthContainerButtonIcon(){
    return Platform.isAndroid?sizePercentWidth!*25:sizePercentWidth!*25;
  } static double WidthContainerButtonIcon1(){
    return Platform.isAndroid?sizePercentWidth!*5:sizePercentWidth!*5;
  }
  static double WidthContainerRealTimer(){
    return Platform.isAndroid?sizePercentWidth!*27:sizePercentWidth!*27;
  }
  static double SizeTextNormal(){

    return Platform.isAndroid?sizePercentWidth!*4:sizePercentWidth!*4;
  }
  static double SizeTextLabel(){
    return Platform.isAndroid?sizePercentWidth!*5:sizePercentWidth!*5;
  }
  static double SizeTextTitile(){
    return Platform.isAndroid?sizePercentWidth!*6:sizePercentWidth!*6;
  }
  static double SizeTextTitileSmall(){
    return Platform.isAndroid?sizePercentWidth!*6:sizePercentWidth!*6;
  }
  static double SizeWidthShowDialog(){
    return Platform.isAndroid?sizePercentWidth!*80:sizePercentWidth!*80;
  }
static double SizeHeightShowDialog(){
    return Platform.isAndroid?sizePercentWidth!*120:sizePercentWidth!*120;
  }
  static double SizeIconShowDialogResponse(){
    return Platform.isAndroid?sizePercentWidth!*30:sizePercentWidth!*30;
  }
  static double SizeWidthDropDownPage(){
    return Platform.isAndroid?sizePercentWidth!*28:sizePercentWidth!*28;
  }
  static double SizeHeightDropDownPage(){

    return Platform.isAndroid?sizePercentWidth!* (checkTablet()==false?20:13):sizePercentWidth!*(checkTablet()==false?20:13);
  }
  static double SizeHeightAppBarHome(){
    return Platform.isAndroid?sizePercentWidth!*(checkTablet()==false?25:20):sizePercentWidth!*(checkTablet()==false?25:20);
  }

  static double SizeTextUnselectedBottomBar(){
    return Platform.isAndroid?sizePercentWidth!*4:sizePercentWidth!*4;
  }
  static double SizeTextSelectedBottomBar(){
    return Platform.isAndroid?sizePercentWidth!*5:sizePercentWidth!*4;
  }
  static double SizeShadowSpeedDial(){
    return Platform.isAndroid?sizePercentWidth!*16:sizePercentWidth!*16;
  }

  static double SizeIconDefault(){
    return Platform.isAndroid?sizePercentWidth!*6:sizePercentWidth!*6;
  }
  static double SizeWidthConTainerCheckInOut(){
    return Platform.isAndroid?sizePercentWidth!*65:sizePercentWidth!*65;
  }
  static double SizeWidthImageCheckInOut(){
    return Platform.isAndroid?sizePercentWidth!*40:sizePercentWidth!*40;
  }

  static double SizePaddingBeetwenContainer(){
    return Platform.isAndroid?sizePercentWidth!*2:sizePercentWidth!*2;
  }
  static double SizeTabBarDefault(){
    return Platform.isAndroid?sizePercentWidth!*8:sizePercentWidth!*8;
  }
  static double SizeHeightAppBarDefault(){
    return Platform.isAndroid?sizePercentWidth!*13:sizePercentWidth!*13;
  }

  static double SizeIconSpeedDial(){
    return Platform.isAndroid?sizePercentWidth!*(SizeLayout.checkTablet()==true?4:10):sizePercentWidth!* (SizeLayout.checkTablet()==true?4:10);
  }

  static double SizeHeightProgressDefault(){
    return Platform.isAndroid?sizePercentWidth!*(SizeLayout.checkTablet()==true?9:15):sizePercentWidth!*(SizeLayout.checkTablet()==true?9:15);
  }
  static double SizeHeightContainerDateDefault(){
    return Platform.isAndroid?sizePercentWidth!*(SizeLayout.checkTablet()==true?60:60):sizePercentWidth!*(SizeLayout.checkTablet()==true?60:60);
  }
  static double SizeHeightItemDateDefault(){
    return Platform.isAndroid?sizePercentWidth!*(SizeLayout.checkTablet()==true?8:8):sizePercentWidth!*(SizeLayout.checkTablet()==true?8:8);
  }
  static double SizeHeightItemDateCupperDefault(){
    return Platform.isAndroid?sizePercentWidth!*(SizeLayout.checkTablet()==true?9:9):sizePercentWidth!*(SizeLayout.checkTablet()==true?9:9);
  }

  static double SizeHeightElevatedButtonDefault(){
    return Platform.isAndroid?sizePercentWidth!*(SizeLayout.checkTablet()==true?10:10):sizePercentWidth!*(SizeLayout.checkTablet()==true?10:10);
  }
  static double SizeWidthElevatedButtonDefault(){
    return Platform.isAndroid?sizePercentWidth!*(SizeLayout.checkTablet()==true?17:17):sizePercentWidth!*(SizeLayout.checkTablet()==true?17:17);
  }

  static double SizeHeightGirdeViewImage(){
    return Platform.isAndroid?sizePercentWidth!*55:sizePercentWidth!*55;
  }
  static double SizeHeightContainerImage(){
    return Platform.isAndroid?sizePercentWidth!*50:sizePercentWidth!*50;
  }


}
