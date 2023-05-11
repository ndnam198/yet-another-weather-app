import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yet_another_weather_app/widgets/app_icons.dart';
import 'package:yet_another_weather_app/widgets/temp_celcius_widget.dart';

import 'widgets/weather_details/current_temp_humi_wind.dart';
import 'widgets/weather_details/day_of_week_weather_forecast.dart';
import 'widgets/weather_details/hourly_weather_forecast.dart';
import 'widgets/weather_details/weather_chart.dart';

const Color blackColor = Color.fromRGBO(51, 40, 33, 1);

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: blackColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
        child: Stack(
          children: [
            Transform.translate(
              offset: const Offset(80, -140),
              child: Image.asset(
                'assets/images/sun_cloud_angled_rain.png',
                alignment: Alignment.topRight,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Berlin,\nGermany',
                  style: GoogleFonts.alegreyaSans(
                    textStyle: const TextStyle(
                      fontSize: 30,
                      height: 36 / 30,
                      fontWeight: FontWeight.w700,
                      color: blackColor,
                    ),
                  ),
                ),
                const TempCelciusWidget(
                  color: blackColor,
                  temperature: 13,
                  dataFontSize: 96,
                  dataLineHeight: 115.2,
                  unitFontSize: 24,
                  unitLineHeight: 28.4,
                  translateUnitY: -12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CurrentWeatherTempHumiWind(
                      data: 6,
                      icon: AppIcons.rain,
                      unit: '%',
                      color: Color.fromRGBO(101, 142, 217, 1),
                    ),
                    CurrentWeatherTempHumiWind(
                      data: 90,
                      icon: AppIcons.humidity,
                      unit: '%',
                      color: Color.fromRGBO(216, 97, 145, 1),
                    ),
                    CurrentWeatherTempHumiWind(
                      data: 19,
                      icon: AppIcons.wind,
                      unit: ' km/h',
                      color: Color.fromRGBO(94, 79, 193, 1),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Today',
                  style: GoogleFonts.alegreyaSans(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      height: 21.6 / 18,
                      fontWeight: FontWeight.w700,
                      color: blackColor,
                    ),
                  ),
                ),
                const WeatherChart(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    HourlyWeatherForecast(
                      temperature: 12,
                      imageUrl: 'assets/images/moon_fast_wind.png',
                      hour: '10 am',
                    ),
                    HourlyWeatherForecast(
                      temperature: 15,
                      imageUrl: 'assets/images/mid_snow_fast_winds.png',
                      hour: '11 am',
                    ),
                    HourlyWeatherForecast(
                      temperature: 20,
                      imageUrl: 'assets/images/moon_cloud_fast_wind.png',
                      hour: '12 am',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const DayOfWeekWeatherForecast(
                  dayOfWeek: 'Monday',
                  imageUrl: 'assets/images/big_rain_drops.png',
                  maxTemp: 13,
                  minTemp: 10,
                ),
                const DayOfWeekWeatherForecast(
                  dayOfWeek: 'Tuesday',
                  imageUrl: 'assets/images/cloud_3_zap.png',
                  maxTemp: 17,
                  minTemp: 12,
                ),
                const DayOfWeekWeatherForecast(
                  dayOfWeek: 'Wednesday',
                  imageUrl: 'assets/images/cloud_3_zap.png',
                  maxTemp: 21,
                  minTemp: 19,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
