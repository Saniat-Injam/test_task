import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// TextStyle getTextStyle({
//   double fontSize = 14.0,
//   FontWeight fontWeight = FontWeight.w400,
//   double lineHeight = 21.0,
//   TextAlign textAlign = TextAlign.center,
//   Color color = Colors.black,
// }) {
//   return GoogleFonts.inter(
//     fontSize: fontSize.sp,
//     fontWeight: fontWeight,
//     height: fontSize.sp / lineHeight.sp,
//     color: color,
//   );
// }

TextStyle getTextStyle({
  double fontSize = 14.0,
  FontWeight fontWeight = FontWeight.w400,
  double lineHeight = 1.5, // line height as a multiple of font size
  double letterSpacing = 0.0, // in logical pixels
  Color color = Colors.black,
}) {
  return GoogleFonts.inter(
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
    height: lineHeight, // 1.4 = 140%
    letterSpacing: letterSpacing, // 0.0 = 0%
    color: color,
  );
}
