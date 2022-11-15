import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Functions/color.dart';
class RectButton extends StatefulWidget {
  const RectButton(
      {Key? key,this.title = ""})
      : super(key: key);

  final String title;

  @override
  State<RectButton> createState() => _RectButtonState();
}

class _RectButtonState extends State<RectButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Palette.main,
          borderRadius: BorderRadius.circular(5)
      ),
      child: Padding(
          padding:
          const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          child: Text(
            widget.title,
            style: GoogleFonts.signikaNegative(
                fontSize: 23, color: Palette.textd, height: 1),
          )),
    );
  }
}
