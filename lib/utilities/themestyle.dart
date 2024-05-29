import 'package:flutter/material.dart';
import 'package:jilly_bank/utilities/themecolor.dart';

class ThemeStles {
  static TextStyle primaryTitle = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, color: ThemeColor.black);
  static TextStyle seeAll = TextStyle(fontSize: 17, color: ThemeColor.black);
  static TextStyle cardDetails = const TextStyle(
    fontSize: 17,
    color: Color(0xff66646d),
    fontWeight: FontWeight.w600,
  );
  static TextStyle cardMoney = const TextStyle(
      color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700);
  static TextStyle tagText = TextStyle(
      color: ThemeColor.black,
      fontSize: 22,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.italic);
  static TextStyle otherDetailsPrimary =
      TextStyle(color: ThemeColor.black, fontSize: 16);
  static TextStyle otherDetailsSecondary =
      TextStyle(color: ThemeColor.grey, fontSize: 12);
}
