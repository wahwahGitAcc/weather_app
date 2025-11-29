import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../weather_detail/ui/city_detail_screen.dart';
import '../data/models/search_city_model.dart';
import '../search_city_bloc/search_city_cubit.dart';
import '../search_city_bloc/search_city_state.dart';


class SearchCityScreen extends StatefulWidget {

  const SearchCityScreen({super.key});

  @override
  State<SearchCityScreen> createState() => _SearchCityScreenState();
}

class _SearchCityScreenState extends State<SearchCityScreen> {
  final TextEditingController cityController = TextEditingController();
  @override
  void dispose() {
    cityController.clear();
    cityController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title:   Text("City Search",style: TextStyle(
            fontSize: 35, fontWeight: FontWeight.w400),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 10.0),
        child: Column(
          children: [
            TextField(
              cursorColor: Colors.blue,
              controller: cityController,
              decoration: InputDecoration(
                hintText: "Enter city name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue, width: 2),  // When focused
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (cityController.text.isNotEmpty) {
                    _searchCity();
                  }
                },
                child: const Text(
                  "Search",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchCityCubit, SearchCityState>(
                builder: (context, state) {
                  return switch (state) {
                    SearchCityLoading() => Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.blue,
                      ),
                    ),
                    SearchCityFormState() => Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            size: 40,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text("City Search")
                        ],
                      ),
                    ),
                    SearchCitySuccess(cityModel: SearchCityModel model) =>
                        _cityList(model),
                    SearchCityFailed() => Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Something wrong",
                            style: TextStyle(fontSize: 24),),
                          SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextButton(
                            onPressed: () {
                              _searchCity();
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
            )
          ],
        ),
      ),
    );
  }
  Widget _cityList(SearchCityModel model) {
    List<CitySearchModel> cities = model.results ?? [];
    return ListView.builder(
      itemCount: cities.length,
      itemBuilder: (context, index) {
        CitySearchModel searchCityModel = cities[index];
        return Card(
          child: ListTile(
            onTap: () {
              debugPrint("Lat **** Lon ${searchCityModel.latitude} ${searchCityModel.longitude}");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CityDetailScreen(
                    latitude: searchCityModel.latitude,
                    longitude: searchCityModel.longitude,
                  ),
                ),
              );
            },
            title: Text(
              searchCityModel.name,
            ),
            subtitle: Text(searchCityModel.country
            ,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),),
          ),
        );
      },
    );
  }

  void _searchCity() {
    String city = cityController.text.trim();
    if (city.isNotEmpty) {
      BlocProvider.of<SearchCityCubit>(context).searchCity(city);
    }
  }
}

