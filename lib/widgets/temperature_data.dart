import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TemperatureData extends StatelessWidget {
  const TemperatureData({
    super.key,
    required this.color,
    required this.data,
    required this.dataFontSize,
    required this.dataLineHeight,
    required this.unitFontSize,
    required this.unitLineHeight,
    this.translateUnitY,
  });

  final Color color;
  final int data;
  final double dataFontSize;
  final double dataLineHeight;
  final double unitFontSize;
  final double unitLineHeight;
  final double? translateUnitY;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$data',
          style: GoogleFonts.alegreyaSans(
            textStyle: TextStyle(
              fontSize: dataFontSize,
              height: dataLineHeight / dataFontSize,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, translateUnitY ?? -dataFontSize / unitFontSize),
          child: Text(
            '°C',
            style: GoogleFonts.alegreyaSans(
              textStyle: TextStyle(
                fontSize: unitFontSize,
                height: unitLineHeight / unitFontSize,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
