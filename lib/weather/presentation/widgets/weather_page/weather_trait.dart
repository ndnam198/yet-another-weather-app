import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherTrait extends StatelessWidget {
  const WeatherTrait({
    super.key,
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: GoogleFonts.alegreyaSans(
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 10,
            height: 12 / 10,
          ),
        ),
      ),
    );
  }
}
