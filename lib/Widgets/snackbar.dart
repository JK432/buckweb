import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Functions/color.dart';

class snackbar{
  SnackBar snackBarSucess(String msg){

    return SnackBar(
      width: 300,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      backgroundColor: Palette.sucess,
      content: msg == null || msg.isEmpty?Text(""):Text(msg,      style: GoogleFonts.signikaNegative(
          fontSize: 25, color: Palette.textd, height: 1),),
    );
  }

  SnackBar snackBarFail(String msg){

    return SnackBar(
      width: 300,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      backgroundColor: Palette.failed,
      content: msg == null || msg.isEmpty?Text("", style: GoogleFonts.signikaNegative(
          fontSize: 25, color: Palette.textl, height: 1),):Text(msg,      style: GoogleFonts.signikaNegative(
          fontSize: 25, color: Palette.textd, height: 1),),
    );
  }




  SnackBar snackBarinfo(String msg){

    return SnackBar(
      //width: 300,
      behavior: SnackBarBehavior.fixed,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      backgroundColor: Palette.mainthf,
      content: msg == null || msg.isEmpty?Text("", style: GoogleFonts.signikaNegative(
          fontSize: 25, color: Palette.textd, height: 1),):Text(msg,      style: GoogleFonts.signikaNegative(
          fontSize: 25, color: Palette.textd, height: 1),),
    );
  }



}
