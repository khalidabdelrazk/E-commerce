import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final IconData? prefixIcon;
  final Color? color;
  final Color? backgroundColor;
  final int? borderRadius;
  final void Function()? onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.prefixIcon,
    this.color,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height * 0.06,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.whiteColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: borderRadius?.toDouble()!=null ? BorderSide(
              width: borderRadius?.toDouble() ?? 0,
              color: AppColors.transparentColor,
            ): BorderSide.none,
          ),
        ),
        onPressed: onPressed,
        child:
            prefixIcon == null
                ? Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: color ?? AppColors.primaryColor,
                  ),
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: color ?? AppColors.primaryColor,
                      ),
                    ),
                    Icon(
                      prefixIcon,
                      color: color ?? AppColors.primaryColor,
                      size: 30,
                    ),
                  ],
                ),
      ),
    );
  }
}
