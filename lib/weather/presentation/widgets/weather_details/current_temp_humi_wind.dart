import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentWeatherTempHumiWind extends StatelessWidget {
  const CurrentWeatherTempHumiWind({
    super.key,
    required this.icon,
    required this.unit,
    required this.data,
    required this.color,
  });

  final IconData icon;
  final String unit;
  final int data;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.5, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color.withOpacity(0.1),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: color,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            '$data$unit',
            style: GoogleFonts.alegreyaSans(
              textStyle: TextStyle(
                fontSize: 14,
                height: 16.8 / 14,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
