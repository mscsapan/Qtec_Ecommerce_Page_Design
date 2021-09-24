import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const mTransparent = Colors.transparent;
const mDarkBlack = Color(0xFF242424);
const mActiveDot = Color(0xFF4C4F56);
const mDeActiveDot = Color(0xFF868991);
const mDescription = Color(0xFF000000);
const mPrice1 = Color(0xFFDD3935);
const mPrice2 = Color(0xFF616161);
const mWhite = Colors.white;
const mYellow = Color(0xFFF2C94C);
const mRed = Colors.red;
const mBlue = Colors.blue;
const mBG = Color(0xFFE5E5E5);
var mGreen = Colors.green[900];

const String description =
    'Lorem ipsum dolor sit\namet,consectetur adipiscing elit. Non purus, odio ornare nam eleifend amet';

TextStyle titleStyle() => GoogleFonts.roboto(
    color: mDarkBlack, fontSize: 22.0, fontWeight: FontWeight.w700);
TextStyle subTitleStyle() => GoogleFonts.roboto(
    color: mDarkBlack, fontSize: 16.0, fontWeight: FontWeight.w400);
Widget buildStar() {
  return Container(
      margin: const EdgeInsets.only(right: 4.0),
      child: const Icon(Icons.star, color: Colors.amber));
}
