import 'package:json_annotation/json_annotation.dart';
part 'current_weather_model.g.dart';

@JsonSerializable()
class CurrentWeatherModel {
  @JsonKey(name: "cod")
  String cod;
  @JsonKey(name: "message")
  int message;
  @JsonKey(name: "cnt")
  int cnt;
  @JsonKey(name: "list")
  List<ListElement> list;
  @JsonKey(name: "city")
  City city;

  CurrentWeatherModel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) => _$CurrentWeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherModelToJson(this);
}

@JsonSerializable()
class City {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "coord")
  Coord coord;
  @JsonKey(name: "country")
  String country;
  @JsonKey(name: "population")
  int population;
  @JsonKey(name: "timezone")
  int timezone;
  @JsonKey(name: "sunrise")
  int sunrise;
  @JsonKey(name: "sunset")
  int sunset;

  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable()
class Coord {
  @JsonKey(name: "lat")
  double lat;
  @JsonKey(name: "lon")
  double lon;

  Coord({
    required this.lat,
    required this.lon,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);

  Map<String, dynamic> toJson() => _$CoordToJson(this);
}

@JsonSerializable()
class ListElement {
  @JsonKey(name: "dt")
  int dt;
  @JsonKey(name: "main")
  Main main;
  @JsonKey(name: "weather")
  List<Weather> weather;
  @JsonKey(name: "clouds")
  Clouds clouds;
  @JsonKey(name: "wind")
  Wind wind;
  @JsonKey(name: "visibility")
  int visibility;
  @JsonKey(name: "pop")
  double pop;
  @JsonKey(name: "rain")
  Rain? rain;
  @JsonKey(name: "sys")
  Sys sys;
  @JsonKey(name: "dt_txt")
  DateTime dtTxt;

  ListElement({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    this.rain,
    required this.sys,
    required this.dtTxt,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => _$ListElementFromJson(json);

  Map<String, dynamic> toJson() => _$ListElementToJson(this);
}

@JsonSerializable()
class Clouds {
  @JsonKey(name: "all")
  int all;

  Clouds({
    required this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);

  Map<String, dynamic> toJson() => _$CloudsToJson(this);
}

@JsonSerializable()
class Main {
  @JsonKey(name: "temp")
  double temp;
  @JsonKey(name: "feels_like")
  double feelsLike;
  @JsonKey(name: "temp_min")
  double tempMin;
  @JsonKey(name: "temp_max")
  double tempMax;
  @JsonKey(name: "pressure")
  int pressure;
  @JsonKey(name: "sea_level")
  int seaLevel;
  @JsonKey(name: "grnd_level")
  int grndLevel;
  @JsonKey(name: "humidity")
  int humidity;
  @JsonKey(name: "temp_kf")
  double tempKf;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);
}

@JsonSerializable()
class Rain {
  @JsonKey(name: "3h")
  double the3H;

  Rain({
    required this.the3H,
  });

  factory Rain.fromJson(Map<String, dynamic> json) => _$RainFromJson(json);

  Map<String, dynamic> toJson() => _$RainToJson(this);
}

@JsonSerializable()
class Sys {
  @JsonKey(name: "pod")
  String pod;

  Sys({
    required this.pod,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);

  Map<String, dynamic> toJson() => _$SysToJson(this);
}

@JsonSerializable()
class Weather {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "main")
  String main;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "icon")
  String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Wind {
  @JsonKey(name: "speed")
  double speed;
  @JsonKey(name: "deg")
  int deg;
  @JsonKey(name: "gust")
  double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  Map<String, dynamic> toJson() => _$WindToJson(this);
}
