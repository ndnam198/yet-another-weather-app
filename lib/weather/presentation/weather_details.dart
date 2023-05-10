import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yet_another_weather_app/widgets/app_icons_icons.dart';

import '../../widgets/temperature_data.dart';

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
                const TemperatureData(
                  color: blackColor,
                  data: 13,
                  dataFontSize: 96,
                  dataLineHeight: 115.2,
                  unitFontSize: 24,
                  unitLineHeight: 28.4,
                  translateUnitY: -12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    WeatherDataItem(
                      data: 6,
                      icon: AppIcons.noun_rain_2438520_1,
                      unit: '%',
                      color: Color.fromRGBO(101, 142, 217, 1),
                    ),
                    WeatherDataItem(
                      data: 90,
                      icon: AppIcons.noun_rain_2438520_1,
                      unit: '%',
                      color: Color.fromRGBO(216, 97, 145, 1),
                    ),
                    WeatherDataItem(
                      data: 19,
                      icon: AppIcons.noun_rain_2438520_1,
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
                    ForecastByHourItem(
                      data: 12,
                      imageUrl: 'assets/images/moon_fast_wind.png',
                      time: '10 am',
                    ),
                    ForecastByHourItem(
                      data: 15,
                      imageUrl: 'assets/images/mid_snow_fast_winds.png',
                      time: '11 am',
                    ),
                    ForecastByHourItem(
                      data: 20,
                      imageUrl: 'assets/images/moon_cloud_fast_wind.png',
                      time: '12 am',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const DayDataItem(
                  dayOfWeek: 'Monday',
                  imageUrl: 'assets/images/big_rain_drops.png',
                  maxTemp: 13,
                  minTemp: 10,
                ),
                const DayDataItem(
                  dayOfWeek: 'Tuesday',
                  imageUrl: 'assets/images/cloud_3_zap.png',
                  maxTemp: 17,
                  minTemp: 12,
                ),
                const DayDataItem(
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

class DayDataItem extends StatelessWidget {
  const DayDataItem({
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
                TemperatureData(
                  color: blackColor,
                  data: maxTemp,
                  dataFontSize: 18,
                  dataLineHeight: 21.6,
                  unitFontSize: 10,
                  unitLineHeight: 12,
                ),
                const SizedBox(
                  width: 10,
                ),
                TemperatureData(
                  color: blackColor.withOpacity(0.5),
                  data: minTemp,
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

class ForecastByHourItem extends StatelessWidget {
  const ForecastByHourItem({
    super.key,
    required this.data,
    required this.imageUrl,
    required this.time,
  });

  final String imageUrl;
  final int data;
  final String time;

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
                  TemperatureData(
                    color: blackColor,
                    data: data,
                    dataFontSize: 36,
                    dataLineHeight: 43.2,
                    unitFontSize: 13,
                    unitLineHeight: 15.6,
                  ),
                  Transform.translate(
                    offset: const Offset(0, 32),
                    child: Text(
                      time,
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

class WeatherChart extends StatelessWidget {
  const WeatherChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 88,
      child: Placeholder(),
    );
  }
}

class WeatherDataItem extends StatelessWidget {
  const WeatherDataItem({
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
