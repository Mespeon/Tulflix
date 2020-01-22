import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

abstract class AppThemeData {
  /// Font sizes
  static const dp72 = 72.0;
  static const dp40 = 40.0;
  static const dp36 = 36.0;
  static const dp32 = 32.0;
  static const dp28 = 28.0;
  static const dp24 = 24.0;
  static const dp20 = 20.0;
  static const dp18 = 18.0;
  static const dp14 = 14.0;
  static const dp12 = 12.0;
  static const dp10 = 10.0;
  static const dp8 = 8.0;

  /// Colors
  static const Color backgroundColor = Color.fromRGBO(17, 17, 17, 1);
  static const Color netflixRed = Color.fromRGBO(229, 9, 20, 1);
  static const Color offWhite = Color.fromRGBO(230, 230, 230, 1);
  static const Color translucentWhite = Color.fromRGBO(230, 230, 230, 0.3);
  static const Color gray = Color.fromRGBO(170, 170, 170, 1);

  /// Paddings
  static const EdgeInsets pad8 = EdgeInsets.all(8);
  static const EdgeInsets pad16 = EdgeInsets.all(16);
  static const EdgeInsets padOvFlR8 = EdgeInsets.only(top: 8, bottom: 8, left: 8);
  static const EdgeInsets padOvFlR16 = EdgeInsets.only(top: 16, bottom: 16, left: 16);
  static const EdgeInsets vpad8 = EdgeInsets.only(top: 8, bottom: 8);
  static const EdgeInsets hpad8 = EdgeInsets.only(left: 8, right: 8);
  static const EdgeInsets vpad16 = EdgeInsets.only(top: 16, bottom: 16);
  static const EdgeInsets hpad16 = EdgeInsets.only(left: 16, right: 16);
  static const EdgeInsets tpad8 = EdgeInsets.only(top: 8);
  static const EdgeInsets tpad16 = EdgeInsets.only(top: 16);
  static const EdgeInsets bpad8 = EdgeInsets.only(bottom: 8);
  static const EdgeInsets bpad16 = EdgeInsets.only(bottom: 16);

  /// Text Styles
  static const TextStyle splashTextRed = TextStyle(fontSize: dp72, fontFamily: 'BebasNeue', color: netflixRed);
  static const TextStyle splashTextWhite = TextStyle(fontSize: dp24, fontFamily: 'BebasNeue', color: offWhite);
  static const TextStyle raisedButtonsText = TextStyle(color: offWhite, fontWeight: FontWeight.bold);
  static const TextStyle flatButtonsText = TextStyle(color: offWhite, fontSize: dp12);
  static const TextStyle heading = TextStyle(color: offWhite, fontSize: dp40, fontFamily: 'BebasNeue');
  static const TextStyle title = TextStyle(color: offWhite, fontSize: dp36, fontFamily: 'BebasNeue');
  static const TextStyle appBarTitle = TextStyle(color: netflixRed, fontFamily: 'BebasNeue', fontSize: dp32);
  static const TextStyle subtitle1 = TextStyle(color: offWhite, fontSize: dp28, fontFamily: 'BebasNeue');
  static const TextStyle subtitle2 = TextStyle(color: offWhite, fontSize: dp24, fontFamily: 'BebasNeue');
  static const TextStyle subtitle3 = TextStyle(color: offWhite, fontSize: dp20, fontFamily: 'BebasNeue');
  static const TextStyle bodyText1 = TextStyle(color: offWhite, fontSize: dp18, fontFamily: 'OpenSans');
  static const TextStyle bodyText2 = TextStyle(color: offWhite, fontSize: dp14, fontFamily: 'OpenSans');
  static const TextStyle bodyText3 = TextStyle(color: offWhite, fontSize: dp12, fontFamily: 'OpenSans');
  static const TextStyle bodyText4 = TextStyle(color: offWhite, fontSize: dp10, fontFamily: 'OpenSans');

  /// UI Elements
  static const TextStyle tabs = TextStyle(fontFamily: 'OpenSans', fontSize: dp8);
  static const TextStyle inputFieldPlaceholder = TextStyle(color: gray, fontSize: dp12);
  static const TextStyle inputFieldText = TextStyle(color: offWhite);
  static const TextStyle footer = TextStyle(fontSize: dp10, fontFamily: 'BebasNeue', color: offWhite);
}