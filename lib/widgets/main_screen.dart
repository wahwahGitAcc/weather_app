import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../features/current_weather/ui/current_weather_screen.dart';
import '../features/search_city/ui/search_city_screen.dart';
import 'location.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final PageController _controller = PageController();
  var lat;
  var lon;
  Position? pos;
  @override
  void initState() {
    super.initState();
    getLatLon();
  }

  getLatLon()async{
    pos = await getCurrentLocation();
    lat = pos?.latitude;
    lon = pos?.longitude;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: (pos == null) ? Center(child: CircularProgressIndicator()):PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        children:  [
          CurrentWeatherScreen(lat: lat,lon:  lon,),
          SearchCityScreen(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          // _controller.jumpToPage(index);
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SearchCityScreen()),
            );
          } else {
            _controller.jumpToPage(0);
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        ],
      ),
    );
  }
}





