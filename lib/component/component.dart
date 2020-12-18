import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas/assets/colors.dart';

class ButtonComponent extends StatelessWidget {
  ButtonComponent(
      {this.onTap,
      this.bgColor,
      @required this.label,
      this.textStyle,
      this.textColor});

  final VoidCallback onTap;
  final Color bgColor, textColor;
  final String label;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 60,
          width: 300,
          decoration: BoxDecoration(
            color: bgColor ?? Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(100),
          ),
          alignment: Alignment.center,
          child: Text(
            label ?? "",
            style: (textStyle != null)
                ? textStyle
                : (textColor != null)
                    ? GoogleFonts.montserrat(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: MyColor().primaryColor,
                      )
                    : Theme.of(context).textTheme.headline3,
          ),
        ));
  }
}

class TextComponent extends StatelessWidget {
  TextComponent(
      {this.hintText,
      this.label,
      this.textEditingController,
      this.textInputType,
      @required this.readOnly});

  final String hintText;
  final String label;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        readOnly: readOnly,
        controller: textEditingController,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.subtitle1,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: Theme.of(context).accentColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: Theme.of(context).accentColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: Theme.of(context).accentColor),
          ),
        ),
      ),
    );
  }
}
