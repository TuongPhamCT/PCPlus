import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pcplus/themes/palette/palette.dart';

class TextDecor {
  TextDecor(this.context);

  BuildContext? context;

  static TextStyle profileTitle = GoogleFonts.roboto(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    color: Palette.main2,
    shadows: [
      Shadow(
        color: Colors.black.withOpacity(0.25),
        offset: const Offset(0, 4),
        blurRadius: 4,
      ),
    ],
    letterSpacing: 1.1,
  );

  static TextStyle robo11 = GoogleFonts.roboto(
    fontSize: 11,
    color: Colors.black,
  );

  static TextStyle robo12 = GoogleFonts.roboto(
    fontSize: 12,
    color: Colors.white,
  );

  static TextStyle robo14 = GoogleFonts.roboto(
    fontSize: 14,
    color: Colors.black,
  );

  static TextStyle profileHintText = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Palette.hintText,
  );

  static TextStyle robo16Medi = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle profileButtonText = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static TextStyle profileIntroText = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static TextStyle profileTextButton = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Palette.main2,
  );

  static TextStyle otpEmailText = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle otpIntroText = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Palette.main1,
  );

  static TextStyle noInternetTitle = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  static TextStyle noInternetDes = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: Colors.black,
  );

  static TextStyle bottomLableSelect = GoogleFonts.roboto(
    fontSize: 12,
  );

  static TextStyle profileName = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Palette.primaryColor,
  );

  static TextStyle orderProfile = GoogleFonts.roboto(
    fontSize: 13,
    fontWeight: FontWeight.w300,
    color: Palette.main1,
  );

  static TextStyle robo18Bold = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle robo24Medi = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
