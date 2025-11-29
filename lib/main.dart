import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/current_weather/current_weather_bloc/current_weather_cubit.dart';
import 'features/search_city/search_city_bloc/search_city_cubit.dart';
import 'features/weather_detail/city_detail_bloc/city_detail_cubit.dart';
import 'locator/locator.dart';
import 'widgets/location.dart';
import 'widgets/main_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  await getCurrentLocation();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchCityCubit>(
          create: (context) => SearchCityCubit(),
        ),
        BlocProvider<CityDetailCubit>(
          create: (context) => CityDetailCubit(),
        ),
        BlocProvider<CurrentWeatherCubit>(
          create: (context) => CurrentWeatherCubit(),
        ),

      ],
      child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Weather App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            ),
            home:
            MainScreen(),
          )
    );
  }
}







