import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';

class CustomTextButton extends StatelessWidget {
  final String txt;
  final void Function()? onPressed;
  const CustomTextButton({super.key, this.onPressed, required this.txt});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        overlayColor: Colors.transparent,
        textStyle: AppStyles.light16White,
      ),
      child: Text(
        txt,
        style: GoogleFonts.poppins(
          color: AppColors.whiteColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.none,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
