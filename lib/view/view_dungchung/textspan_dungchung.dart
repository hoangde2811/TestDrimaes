
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/ColorUtils/colors_utils.dart';
import '../../utils/FontWeight/fontweight.dart';
import '../../utils/SizeLayout/sizelayout.dart';

 class TextSpanDungChung {
  String? text;
  Color? color_text;
  FontWeight? fontWeight;
  TextSpanDungChung({this.text, this.color_text, this.fontWeight});

  getTextSpan({String? landspace}){
   return TextSpan(text:text!=null?text:"",style: GoogleFonts.roboto(fontSize: SizeLayout.SizeTextNormal(),color:color_text!=null?color_text: ColorUtils.black,fontWeight:fontWeight!=null?fontWeight:null) );
  }
  // getTextSpanTitle(){
  //  return TextSpan(text:text!=null?text:"",style: TextStyle(fontSize: SizeLayout.SizeTextTitile(),color:color_text!=null?color_text: ColorUtils.black,fontWeight:fontWeight!=null?fontWeight: FontWeightUtils.fontweight_600) );
  // }
  getTextSpanTitle({String? landspace}){
   return TextSpan(text:text!=null?text:"",style: GoogleFonts.roboto(fontSize: SizeLayout.SizeTextTitile(),color:color_text!=null?color_text: ColorUtils.black,fontWeight:fontWeight!=null?fontWeight: FontWeightUtils.fontweight_600));
  }
  getTextSpanTitleSmall(){
   return TextSpan(text:text!=null?text:"",style: GoogleFonts.roboto(fontSize: SizeLayout.SizeTextTitile(),color:color_text!=null?color_text: ColorUtils.black,fontWeight:fontWeight!=null?fontWeight: FontWeightUtils.fontweight_600) );
  }
  getTextSpanLabel(){
   return TextSpan(text:text!=null?text:"",style: GoogleFonts.roboto(fontSize: SizeLayout.SizeTextLabel(),color:color_text!=null?color_text: ColorUtils.black,fontWeight: fontWeight!=null?fontWeight: FontWeightUtils.fontweight_600) );
  }
}