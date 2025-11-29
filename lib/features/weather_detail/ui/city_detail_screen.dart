import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../current_weather/ui/weather_icon.dart';
import '../city_detail_bloc/city_detail_cubit.dart';
import '../city_detail_bloc/city_detail_state.dart';
import '../data/models/city_detail_model.dart';



class CityDetailScreen extends StatefulWidget {
  final double latitude;
  final double longitude;
  const CityDetailScreen({super.key, required this.latitude, required this.longitude});

  @override
  State<CityDetailScreen> createState() => _CityDetailScreenState();
}

class _CityDetailScreenState extends State<CityDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getWeatherDetail();
    });
  }

  void _getWeatherDetail() {
    BlocProvider.of<CityDetailCubit>(context).cityDetail(
       widget.latitude,
       widget.longitude,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff283593),
              Colors.blue,
              Colors.white
            ],
          ),
        ),
        child: BlocBuilder<CityDetailCubit, CityDetailState>(
          builder: (context, state) {
            return switch (state) {
              CityDetailLoading() => Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
              CityDetailSuccess(detailModel: CityDetailModel detail) =>
                  _currentWeather(detail),
              CityDetailFailed() => Center(
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
                        _getWeatherDetail();
                      },
                      child: Text("Try Again",
                      style: TextStyle(fontSize: 20),),
                    ),
                  ],
                ),
              ),
            };
          },
        ),
      ),
    );
  }

  Widget _currentWeather(CityDetailModel detail) {
    CityDetailModel currentWeather = detail;
    double celsius = currentWeather.main.temp - 273.15;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(getWeatherIcon(currentWeather.weather[0].icon,),
          width: 120,height: 120,),
          SizedBox(height: 20,),
          Text(
            "${currentWeather.name}, ${currentWeather.sys.country}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32.0,
              fontWeight: FontWeight.w400,
            ),
          ),

          Text(
            "${celsius.toStringAsFixed(0)}°",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 80,
            ),
          ),
        ],
      ),
    );
  }
}

