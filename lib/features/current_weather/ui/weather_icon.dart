String getWeatherIcon(String iconCode) {
  switch (iconCode) {
    case "01d":
      return "assets/icons/sun.png";
    case "01n":
      return "assets/icons/moon.png";

    case "02d":
      return "assets/icons/cloud_sun.png";
    case "02n":
      return "assets/icons/cloud_moon.png";

    case "03d":
    case "03n":
      return "assets/icons/cloud.png";

    case "04d":
    case "04n":
      return "assets/icons/clouds.png";

    case "09d":
    case "09n":
      return "assets/icons/shower_rain.png";

    case "10d":
      return "assets/icons/rain_sun.png";
    case "10n":
      return "assets/icons/rain_moon.png";

    case "11d":
    case "11n":
      return "assets/icons/storm.png";

    case "13d":
    case "13n":
      return "assets/icons/snow.png";

    case "50d":
    case "50n":
      return "assets/icons/fog.png";
  }
  return "assets/icons/cloud.png";
}
