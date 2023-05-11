import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yet_another_weather_app/weather/presentation/weather_details.dart';
import 'package:yet_another_weather_app/widgets/temp_celcius_widget.dart';

class DayOfWeekWeatherForecast extends StatelessWidget {
  const DayOfWeekWeatherForecast({
    super.key,
    required this.dayOfWeek,
    required this.imageUrl,
    required this.maxTemp,
    required this.minTemp,
  });

  final String dayOfWeek;
  final String imageUrl;
  final int maxTemp;
  final int minTemp;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Text(
            dayOfWeek,
            textAlign: TextAlign.start,
            style: GoogleFonts.alegreyaSans(
              textStyle: const TextStyle(
                fontSize: 18,
                height: 21.6 / 18,
                fontWeight: FontWeight.w700,
                color: blackColor,
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 87),
                  child: Image.asset(
                    imageUrl,
                    alignment: Alignment.center,
                  ),
                ),
                TempCelciusWidget(
                  color: blackColor,
                  temperature: maxTemp,
                  dataFontSize: 18,
                  dataLineHeight: 21.6,
                  unitFontSize: 10,
                  unitLineHeight: 12,
                ),
                const SizedBox(
                  width: 10,
                ),
                TempCelciusWidget(
                  color: blackColor.withOpacity(0.5),
                  temperature: minTemp,
                  dataFontSize: 18,
                  dataLineHeight: 21.6,
                  unitFontSize: 10,
                  unitLineHeight: 12,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
