import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color.dart';

ThemeData appTheme() {
  return ThemeData(
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.lato(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
      bodyMedium: GoogleFonts.lato(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
      bodySmall: GoogleFonts.lato(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
      labelLarge: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
      labelMedium: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.softGrey,
      ),
      labelSmall: GoogleFonts.lato(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.darkGrey,
      ),
       
    ),
    
  );
}
