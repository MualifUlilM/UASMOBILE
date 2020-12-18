import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas/pages/home_page.dart';
import 'package:uas/assets/colors.dart';
import 'package:uas/service/route_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          backgroundColor: MyColor().primaryColor,
          primarySwatch: MyColor().primaryColor,
          primaryColor: MyColor().primaryColor,
          accentColor: MyColor().accentColor,
          buttonColor: MyColor().textColor,
          textTheme: TextTheme(
            headline1: GoogleFonts.montserrat(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: MyColor().textColor,
            ),
            headline2: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.w300,
              color: MyColor().textColor,
            ),
            subtitle1: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: MyColor().textColor,
            ),
            headline3: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: MyColor().textColor,
            ),
          )),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      onGenerateRoute: MyRouter().generateRoute,
    );
  }
}
