import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/models/current_weather_model.dart';
import 'weather_icon.dart';

Widget weatherCard(ListElement list){
  double celsius = list.main.temp - 273.15;
  return Container(
    width: 60,
    margin: EdgeInsets.symmetric(horizontal: 9),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          DateFormat('EEE').format(list.dtTxt),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Image.asset(getWeatherIcon(
            list.weather[0].icon
        ),
          width: 45,height: 45,),
        SizedBox(height: 8),
        Text(
          "${celsius.toStringAsFixed(0)}°",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}