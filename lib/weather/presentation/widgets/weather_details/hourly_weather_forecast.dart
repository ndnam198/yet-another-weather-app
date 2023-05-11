import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yet_another_weather_app/widgets/temp_celcius_widget.dart';

import '../../weather_details.dart';

class HourlyWeatherForecast extends StatelessWidget {
  const HourlyWeatherForecast({
    super.key,
    required this.temperature,
    required this.imageUrl,
    required this.hour,
  });

  final String imageUrl;
  final int temperature;
  final String hour;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: 90,
      child: Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: 109,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 230, 230, 230),
                    blurRadius: 12,
                    offset: Offset(0, 12),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  TempCelciusWidget(
                    color: blackColor,
                    temperature: temperature,
                    dataFontSize: 36,
                    dataLineHeight: 43.2,
                    unitFontSize: 13,
                    unitLineHeight: 15.6,
                  ),
                  Transform.translate(
                    offset: const Offset(0, 32),
                    child: Text(
                      hour,
                      style: GoogleFonts.alegreyaSans(
                        textStyle: TextStyle(
                          fontSize: 14,
                          height: 16.8 / 14,
                          fontWeight: FontWeight.w500,
                          color: blackColor.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            imageUrl,
            filterQuality: FilterQuality.high,
            alignment: Alignment.topCenter,
          ),
        ],
      ),
    );
  }
}
