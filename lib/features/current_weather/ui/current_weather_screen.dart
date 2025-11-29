import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../current_weather_bloc/current_weather_cubit.dart';
import '../current_weather_bloc/current_weather_state.dart';
import '../data/models/current_weather_model.dart';
import 'current_weather_data_screen.dart';


class CurrentWeatherScreen extends StatefulWidget {
  final double lat;
  final double lon;
  const CurrentWeatherScreen({super.key,required this.lat,required this.lon});

  @override
  State<CurrentWeatherScreen> createState() => _CurrentWeatherScreenState();
}

class _CurrentWeatherScreenState extends State<CurrentWeatherScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getCurrentWeather();
    });
  }

  void _getCurrentWeather(){
    BlocProvider.of<CurrentWeatherCubit>(context).currentWeather(
      lat: widget.lat,
      lon: widget.lon,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
        builder: (context, state) {
          return switch (state){
            CurrentWeatherLoading() =>
                Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                ),
            CurrentWeatherSuccess(currentModel: CurrentWeatherModel model) =>
            CurrentWeatherDataScreen(currentModel: model,),
            CurrentWeatherFailed() =>
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Something wrong",
                        style: TextStyle(fontSize: 24),),
                      SizedBox(
                        height: 16,
                      ),
                      TextButton(
                        onPressed: () {
                          _getCurrentWeather();
                        },
                        child: Text("Try Again",
                          style: TextStyle(fontSize: 20),),
                      ),

                    ],
                  ),
                )
          };
        }
      ),
    );
  }
}



