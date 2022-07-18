/// --------------------------------------------------
/// constants.dart
///
/// -> all App constants go here
/// --------------------------------------------------

/// Imports ------------------------------------------
import 'package:flutter/material.dart';

/// Imports ------------------------------------------

const kAppTitle = 'Aspect Flutter App';

//Basic App Colors
const kStyleGuideColorViolet = Color.fromRGBO(117, 108, 210, 1.0);
const kStyleGuideColorLightBlue = Color.fromRGBO(123, 232, 242, 1.0);
const kStyleGuideColorRed = Color.fromRGBO(225, 55, 103, 1.0);
const kStyleGuideColorOrange = Color.fromRGBO(244, 125, 58, 1.0);
const kStyleGuideColorGreen = Color.fromRGBO(34, 222, 154, 1.0);
const kStyleGuideColorBlue = Color.fromRGBO(80, 141, 247, 1.0);
const kStyleGuideColorOnyx = Color.fromRGBO(29, 32, 41, 1.0);
const kStyleGuideColorDarkGrey = Color.fromRGBO(38, 41, 52, 1.0);
const kStyleGuideColorLightGrey = Color.fromRGBO(116, 119, 129, 1.0);
const kStyleGuideColorWhite = Color.fromRGBO(248, 245, 255, 1.0);

//Bottom Navigation Styling -------------------------------------
const kNavigationButtonColorSelected = Colors.pinkAccent;
const kNavigationButtonColor = Colors.white;
const kNavigationIconHome = Icon(
  Icons.dashboard,
  size: 30,
);
const kNavigationIconStatistics = Icon(Icons.insights);
const kNavigationIconNFTCollection = Icon(
  Icons.rocket_launch,
  size: 30,
);
const kNavigationIconGames = Icon(Icons.sports_esports);
const kNavigationIconProfile = Icon(Icons.account_circle);
//Bottom Navigation Styling -------------------------------------

const kAddGameSheetColor = kStyleGuideColorViolet;

const kAddGameModalBoxDecoration = BoxDecoration(
  color: kAddGameSheetColor,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20.0),
    topRight: Radius.circular(20.0),
  ),
);

const kLoginButtonTextStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.w600,
  color: kStyleGuideColorWhite,
);
