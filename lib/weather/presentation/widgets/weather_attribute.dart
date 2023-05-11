import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherAttribute extends StatelessWidget {
  const WeatherAttribute({
    super.key,
    required this.icon,
    required this.label,
    required this.unit,
    required this.data,
  });

  final IconData icon;
  final String label;
  final String unit;
  final double data;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = GoogleFonts.alegreyaSans(
      textStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 16 / 16,
      ),
    );

    return SizedBox(
      width: 160,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 24,
                color: Colors.white,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                label,
                style: textStyle,
              )
            ],
          ),
          Text(
            '${data.toString()}$unit',
            style: textStyle,
          )
        ],
      ),
    );
  }
}
