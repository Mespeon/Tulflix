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
  // static const Color backgroundColor = Color.fromRGBO(17, 17, 17, 1);
  static const Color backgroundColor = Color.fromRGBO(33, 33, 33, 1);
  static const Color backgroundColorTranslucent = Color.fromRGBO(33, 33, 33, 0.8);
  static const Color bluegreyBackground = Color.fromRGBO(38, 50, 56, 1);
  static const Color netflixRed = Color.fromRGBO(229, 9, 20, 1);
  static const Color offWhite = Color.fromRGBO(230, 230, 230, 1);
  static const Color translucentWhite = Color.fromRGBO(230, 230, 230, 0.3);
  static const Color gray = Color.fromRGBO(170, 170, 170, 1);

  /// Paddings
  static const EdgeInsets pad8 = EdgeInsets.all(8);
  static const EdgeInsets pad16 = EdgeInsets.all(16);
  static const EdgeInsets pad24 = EdgeInsets.all(24);
  static const EdgeInsets pad32 = EdgeInsets.all(32);
  static const EdgeInsets padOvFlR8 = EdgeInsets.only(top: 24, bottom: 8, left: 8);
  static const EdgeInsets padOvFlR16 = EdgeInsets.only(top: 16, bottom: 16, left: 16);
  static const EdgeInsets vpad4 = EdgeInsets.symmetric(vertical: 4);
  static const EdgeInsets vpad8 = EdgeInsets.symmetric(vertical: 8);
  static const EdgeInsets hpad8 = EdgeInsets.symmetric(horizontal: 8);
  static const EdgeInsets hpad4 = EdgeInsets.only(left: 4, right: 4);
  static const EdgeInsets hpad24 = EdgeInsets.only(left: 24, right: 24);
  static const EdgeInsets hpad32 = EdgeInsets.only(left: 32, right: 32);
  static const EdgeInsets vpad16 = EdgeInsets.only(top: 16, bottom: 16);
  static const EdgeInsets vpad24 = EdgeInsets.only(top: 24, bottom: 24);
  static const EdgeInsets vpad32 = EdgeInsets.only(top: 32, bottom: 32);
  static const EdgeInsets hpad16 = EdgeInsets.only(left: 16, right: 16);
  static const EdgeInsets tpad8 = EdgeInsets.only(top: 8);
  static const EdgeInsets tpad16 = EdgeInsets.only(top: 16);
  static const EdgeInsets bpad4 = EdgeInsets.only(bottom: 4);
  static const EdgeInsets bpad8 = EdgeInsets.only(bottom: 8);
  static const EdgeInsets bpad16 = EdgeInsets.only(bottom: 16);
  static const EdgeInsets rpad8 = EdgeInsets.only(right: 8);
  static const EdgeInsets rpad16 = EdgeInsets.only(right: 16);

  /// Text Styles
  static const TextStyle splashTextRed = TextStyle(fontSize: dp72, fontFamily: 'BebasNeue', color: netflixRed);
  static const TextStyle splashTextWhite = TextStyle(fontSize: dp24, fontFamily: 'BebasNeue', color: offWhite);
  static const TextStyle raisedButtonsRedText = TextStyle(color: offWhite, fontWeight: FontWeight.bold);
  static const TextStyle raisedButtonsWhiteText = TextStyle(color: backgroundColor, fontWeight: FontWeight.bold);
  static const TextStyle flatButtonsText = TextStyle(color: offWhite, fontSize: dp12);
  static const TextStyle heading = TextStyle(color: offWhite, fontSize: dp40, fontFamily: 'BebasNeue');
  static const TextStyle heading2 = TextStyle(color: offWhite, fontSize: dp40, fontFamily: 'OpenSans', fontWeight: FontWeight.w600);
  static const TextStyle title = TextStyle(color: offWhite, fontSize: dp40, fontFamily: 'OpenSans', fontWeight: FontWeight.w800, height: 1);
  static const TextStyle appBarTitle = TextStyle(color: netflixRed, fontFamily: 'BebasNeue', fontSize: dp32);
  static const TextStyle appBarTitleSm = TextStyle(color: offWhite, fontSize: dp14, fontFamily: 'OpenSans', fontWeight: FontWeight.w700);
  static const TextStyle subtitle1 = TextStyle(color: offWhite, fontSize: dp28, fontFamily: 'BebasNeue');
  static const TextStyle subtitle2 = TextStyle(color: offWhite, fontSize: dp24, fontFamily: 'BebasNeue');
  static const TextStyle subtitle3 = TextStyle(color: offWhite, fontSize: dp20, fontFamily: 'BebasNeue');
  static const TextStyle umbrella = TextStyle(color: offWhite, fontSize: dp14, fontFamily: 'OpenSans', fontWeight: FontWeight.bold);
  static const TextStyle bodyText1 = TextStyle(color: offWhite, fontSize: dp18, fontFamily: 'OpenSans');
  static const TextStyle bodyText2 = TextStyle(color: offWhite, fontSize: dp14, fontFamily: 'OpenSans');
  static const TextStyle bodyText3 = TextStyle(color: offWhite, fontSize: dp12, fontFamily: 'OpenSans');
  static const TextStyle bodyText4 = TextStyle(color: offWhite, fontSize: dp10, fontFamily: 'OpenSans');

  /// UI Elements
  static const TextStyle tabs = TextStyle(fontFamily: 'OpenSans', fontSize: dp8);
  static const TextStyle appBarFlatButtons = TextStyle(fontFamily: 'OpenSans', fontSize: dp12, fontWeight: FontWeight.w200);
  static const TextStyle listTileTitle = TextStyle(color: offWhite, fontWeight: FontWeight.bold);
  static const TextStyle inputFieldPlaceholder = TextStyle(color: gray, fontSize: dp12);
  static const TextStyle inputFieldText = TextStyle(color: offWhite);
  static const TextStyle profileUserName = TextStyle(color: offWhite, fontSize: dp24, fontFamily: 'OpenSans', fontWeight: FontWeight.w700, height: 1);
  static const TextStyle profileAbout = TextStyle(color: offWhite, fontSize: dp12, fontFamily: 'OpenSans', height: 1.3);
  static const TextStyle footer = TextStyle(fontSize: dp10, fontFamily: 'BebasNeue', color: offWhite);
}