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

      //    color: Colors.white60
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

extension on int {
  String toCondition() {
    switch (this) {
      case 0:
        return 'Clear';
      case 1:
      case 2:
      case 3:
      case 45:
      case 48:
        return 'Clouds';
      case 51:
      case 53:
      case 55:
      case 56:
      case 57:
      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
      case 80:
      case 81:
      case 82:
      case 95:
      case 96:
      case 99:
        return 'Rainy';
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return 'Snowy';
      default:
        return 'Unknown';
    }
  }
}

extension on String {
  String toEmoji() {
    switch (this) {
      case "Clear":
        return '☀️';
      case "Rainy":
        return '🌧️';
      case 'Cloud':
        return '☁️';
      case 'Snowy':
        return '🌨️';
      default:
        return 'Unknown';
    }
  }
}
