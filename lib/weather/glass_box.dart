// ignore_for_file: sized_box_for_whitespace

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meteo_app/constants/colors.dart';

class GlassBox extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;

  const GlassBox({
    super.key,
    required this.height,
    required this.width,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.whiteColor),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.whiteColor.withOpacity(.4),
                    AppColors.whiteColor.withOpacity(.1),
                  ],
                ),
              ),
            ),
            child
          ],
        ),
      ),
    );
  }
}
