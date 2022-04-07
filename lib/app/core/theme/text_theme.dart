import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class WebTextTheme {
  TextTheme textTheme(BuildContext context) {
    return GoogleFonts.montserratAlternatesTextTheme(
      Theme.of(context).textTheme,
    );
  }
}
