import 'package:flutter/widgets.dart';

double getResponsiveFontSize(BuildContext context, double baseFontSize) {
  final screenWidth = MediaQuery.of(context).size.width;
  final scaleFactor = screenWidth / 389; // 389 is the design width, adjust if needed
  return baseFontSize * scaleFactor;
}