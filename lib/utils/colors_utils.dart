import 'package:flutter/material.dart';

hesxStringToColor(String hexColor){
  hexColor=hexColor.toUpperCase().replaceAll('#', "");
  if(hexColor.length==6){
    hexColor='FF'+hexColor;

  }
  return Color(int.parse(hexColor,radix:16));
}