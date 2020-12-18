import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uas/assets/colors.dart';
import 'package:uas/pages/detail_page.dart';
import 'package:uas/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas/pages/input_page.dart';
import 'package:uas/pages/update_page.dart';
import 'package:uas/pages/view_page.dart';

class MyRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (ctx) => MyHomePage());
        break;
      case '/input':
        return MaterialPageRoute(builder: (ctx) => InputPage());
        break;
      case '/view':
        return MaterialPageRoute(builder: (ctx) => ViewPage());
        break;
      case '/detail':
        return MaterialPageRoute(
            builder: (ctx) => DetailPage(settings.arguments));
        break;
      case '/edit':
        return MaterialPageRoute(builder: (ctx) => UpdatePage());
        break;
      default:
        return MaterialPageRoute(
            builder: (ctx) => Scaffold(
                  backgroundColor: MyColor().primaryColor,
                  body: Center(
                      child: Text("404 Not Found",
                          style: GoogleFonts.montserrat(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: MyColor().textColor,
                          ))),
                ));
    }
  }
}
