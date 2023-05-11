import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:yet_another_weather_app/common/providers.dart';
import 'package:yet_another_weather_app/weather/domain/current_weather_model.dart';
import 'package:yet_another_weather_app/weather/providers.dart';
import 'package:yet_another_weather_app/widgets/app_icons.dart';

import 'current_prep_humi_wind.dart';
import 'weather_trait.dart';

class WeatherGeneralStatisticsListItem extends ConsumerWidget {
  const WeatherGeneralStatisticsListItem({
    super.key,
  });

  double translateImage(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    if (height < 700) {
      return -32;
    } else {
      return 16;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<CurrentWeatherModel> state =
        ref.watch(currentWeatherControllerProvider);
    final logger = ref.watch(loggerProvider);

    return state.when(
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) =>
          const Text('Oops, something unexpected happened'),
      data: (weatherData) {
        final formattedDate = DateFormat('EEEE, h a').format(
          DateTime.fromMillisecondsSinceEpoch(weatherData.timestamp! * 1000),
        );

        return Stack(
          alignment: Alignment.topCenter,
          children: [
            Transform.translate(
              offset: const Offset(0, 45),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 230,
                    height: 247,
                    padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFFFBFBFB),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Los Angeles, CA, USA',
                          style: GoogleFonts.alegreyaSans(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              height: 24 / 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  weatherData.temperature!.ceil().toString(),
                                  style: GoogleFonts.alegreyaSans(
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 64,
                                      height: 50 / 64,
                                    ),
                                  ),
                                ),
                                Text(
                                  '°C',
                                  style: GoogleFonts.alegreyaSans(
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      height: 16.8 / 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                WeatherTrait(
                                    title: 'Strong Winds',
                                    color: Color.fromRGBO(212, 66, 111, 0.5)),
                                SizedBox(
                                  height: 4,
                                ),
                                WeatherTrait(
                                    title: 'Cloudy',
                                    color: Color.fromRGBO(106, 117, 186, 0.5)),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          formattedDate,
                          style: GoogleFonts.alegreyaSans(
                            textStyle: const TextStyle(
                              color: Color.fromRGBO(51, 40, 33, 0.5),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              height: 16.8 / 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -20),
                    child: FilledButton(
                      onPressed: () {
                        context.push('/details');
                      },
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        backgroundColor: const Color(0xFF5E4FC1),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 48, vertical: 16),
                        minimumSize: const Size(163, 47),
                      ),
                      child: Text(
                        'VIEW STATS',
                        style: GoogleFonts.alegreyaSans(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            height: 16.8 / 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  CurrentPrepHumidWind(
                    data: weatherData.cloudiness,
                    icon: AppIcons.rain,
                    label: 'Precipitation',
                    unit: '%',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CurrentPrepHumidWind(
                    data: weatherData.humidity,
                    icon: AppIcons.humidity,
                    label: 'Humidity',
                    unit: '%',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CurrentPrepHumidWind(
                    data: weatherData.windSpeed!,
                    icon: AppIcons.wind,
                    label: 'Wind',
                    unit: ' km/h',
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(0, translateImage(context)),
              child: Image.asset(
                'assets/images/moon_cloud_fast_wind.png',
                width: 300,
                height: 300,
              ),
            ),
          ],
        );
      },
    );
  }
}
