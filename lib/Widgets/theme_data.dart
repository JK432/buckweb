import 'package:flutter/material.dart';

import '../Functions/color.dart';
class theme{

  ThemeData themeData(){
    ThemeData td = ThemeData(
      primarySwatch: AppColor().generateMaterialColor(Palette.main),
      backgroundColor: AppColor().generateMaterialColor(Palette.bgl),
      canvasColor: AppColor().generateMaterialColor(Palette.bgl)

    );
    return td;
  }
}