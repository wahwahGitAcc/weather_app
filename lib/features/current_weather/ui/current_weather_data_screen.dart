import 'package:flutter/material.dart';
import '../data/models/current_weather_model.dart';
import 'weather_card.dart';
import 'weather_icon.dart';

class CurrentWeatherDataScreen extends StatelessWidget {
  final CurrentWeatherModel currentModel;
  const CurrentWeatherDataScreen({super.key, required this.currentModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: buildForecastUI(
        currentModel.list,
        currentModel.city.name,
        currentModel.city.country,
      ),
    );
  }

}


Widget buildForecastUI(List<ListElement> list,String city,String countryCode) {
  final currentWeather = getCurrentWeather(list);
  final nextFiveDays = getNextFiveDays(list);
  double celsius = currentWeather.main.temp - 273.15;

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text("Current Weather", style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400)),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(getWeatherIcon(
              currentWeather.weather[0].icon
          ),
            width: 150,height: 100,),
          SizedBox(height: 15,),
          Column(
            children: [
              Text("$city, $countryCode",
              style: TextStyle(fontSize: 32.0,fontWeight: FontWeight.w400),),
              Text(
                "${celsius.toStringAsFixed(0)}°",
                style: TextStyle(fontSize: 80,fontWeight: FontWeight.w300),
              ),
              Text(currentWeather.weather[0].main, style: TextStyle(fontSize: 28,
                  color: Colors.lightBlue,fontWeight: FontWeight.w500)),
            ],
          )
        ],
      ),
      SizedBox(
        height: 130,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: nextFiveDays.length,
          itemBuilder: (context, index) {
            final item = nextFiveDays[index];
            return weatherCard(item);
          },
        ),
      ),
    ],
  );
}



ListElement getCurrentWeather(List<ListElement> list) {
  DateTime now = DateTime.now();

  list.sort((a, b) => a.dtTxt.compareTo(b.dtTxt));

  for (var item in list) {
    if (now.isBefore(item.dtTxt)) {
      return item;
    }
  }
  return list.last;
}

List<ListElement> getNextFiveDays(List<ListElement> list) {
  Map<String, ListElement> dayMap = {};

  for (var item in list) {
    String dayKey = "${item.dtTxt.year}-${item.dtTxt.month}-${item.dtTxt.day}";

    if (!dayMap.containsKey(dayKey)) {
      dayMap[dayKey] = item;
    }
  }

  DateTime now = DateTime.now();
  String todayKey = "${now.year}-${now.month}-${now.day}";
  dayMap.remove(todayKey);

  return dayMap.values.take(5).toList();
}



