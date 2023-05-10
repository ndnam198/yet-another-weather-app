import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/app_icons_icons.dart';
import '../domain/current_weather_model.dart';
import '../providers.dart';
import 'widgets/weather_item.dart';

class CurrentWeatherPage extends ConsumerStatefulWidget {
  const CurrentWeatherPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WeatherGeneralState();
}

class _WeatherGeneralState extends ConsumerState<CurrentWeatherPage> {
  @override
  Widget build(BuildContext context) {
    AsyncValue<CurrentWeatherModel> state =
        ref.watch(currentWeatherControllerProvider);

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        margin: const EdgeInsets.all(16),
        onTap: (int id) {},
        currentIndex: 0,
        items: [
          FloatingNavbarItem(icon: AppIcons.iconoir_home_simple, title: 'Home'),
          FloatingNavbarItem(
              icon: AppIcons.noun_search_4511428_1, title: 'Explore'),
          FloatingNavbarItem(
              icon: AppIcons.bi_bookmark_dash_fill, title: 'Bookmarks'),
          FloatingNavbarItem(
              icon: AppIcons.fluent_person_16_filled, title: 'Personal'),
        ],
        selectedItemColor: const Color.fromRGBO(216, 97, 145, 1),
        unselectedItemColor: const Color(0xFFC4C4C4),
        backgroundColor: Colors.white,
        borderRadius: 20,
      ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xFFFBFBFB),
        leadingWidth: 56 + 16,
        leading: Image.asset(
          'assets/images/app_logo.png',
          height: 56,
          width: 56,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              AppIcons.filter_icon,
              size: 24,
            ),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(231, 84, 129, 1),
              Color.fromRGBO(146, 156, 222, 1),
            ],
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
          ),
        ),
        child: const Center(
          child: WeatherItem(),
        ),
      ),
    );
  }
}
