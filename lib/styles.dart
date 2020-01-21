import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

abstract class AppThemeData {
  /// Font sizes
  static const oversizedHeadings = 72.0;
  static const headings = 40.0;
  static const titles = 36.0;
  static const subtitles = 28.0;
  static const subtitles2 = 24.0;
  static const subtitles3 = 20.0;
  static const body1 = 18.0;
  static const body2 = 14.0;
  static const body3 = 12.0;
  static const body4 = 10.0;

  /// Colors
  static const Color backgroundColor = Color.fromRGBO(17, 17, 17, 1);
  static const Color netflixRed = Color.fromRGBO(229, 9, 20, 1);
  static const Color offWhite = Color.fromRGBO(230, 230, 230, 1);
  static const Color translucentWhite = Color.fromRGBO(230, 230, 230, 0.3);

  /// TextStyles
  static const TextStyle splashTextRed = TextStyle(fontSize: oversizedHeadings, fontFamily: 'BebasNeue', color: netflixRed);
  static const TextStyle splashTextWhite = TextStyle(fontSize: subtitles2, fontFamily: 'BebasNeue', color: offWhite);
  static const TextStyle raisedButtonsText = TextStyle(color: offWhite, fontWeight: FontWeight.bold);
  static const TextStyle flatButtonsText = TextStyle(color: offWhite, fontSize: body3);
  static const TextStyle heading = TextStyle(color: offWhite, fontSize: headings, fontFamily: 'BebasNeue');
  static const TextStyle title = TextStyle(color: offWhite, fontSize: titles, fontFamily: 'BebasNeue');
  static const TextStyle subtitle1 = TextStyle(color: offWhite, fontSize: subtitles, fontFamily: 'BebasNeue');
  static const TextStyle subtitle2 = TextStyle(color: offWhite, fontSize: subtitles2, fontFamily: 'BebasNeue');
  static const TextStyle subtitle3 = TextStyle(color: offWhite, fontSize: subtitles3, fontFamily: 'BebasNeue');
  static const TextStyle bodyText1 = TextStyle(color: offWhite, fontSize: body1);
  static const TextStyle bodyText2 = TextStyle(color: offWhite, fontSize: body2);
  static const TextStyle bodyText3 = TextStyle(color: offWhite, fontSize: body3);
  static const TextStyle bodyText4 = TextStyle(color: offWhite, fontSize: body4);
  static const TextStyle footer = TextStyle(fontSize: body4, fontFamily: 'BebasNeue', color: offWhite);
}