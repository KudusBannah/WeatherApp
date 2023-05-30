import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/network.dart';
import 'package:weather_app/services/timezone.dart';

const openWeatherAppId = "25bfb5784e938c74e16224c94bc0355a";
const worldTimeId = "6b7dc1be40814ce3b36184f1c14c7d0d";

class WeatherModel {
  Future<dynamic> getLocationData() async {
    Locator geoLocator = Locator();
    await geoLocator.getLocation();
    Network network = Network(
        "http://api.openweathermap.org/data/2.5/weather?lat=${geoLocator.latitude}&lon=${geoLocator.longitude}&appid=$openWeatherAppId&units=metric");
    var weatherData = await network.getWeatherData();

    TimeZone timeZone = TimeZone(
        "https://api.opencagedata.com/geocode/v1/json?q=${geoLocator.latitude}+${geoLocator.longitude}&key=$worldTimeId");
    var timezoneData = await timeZone.getTimeData();

    return [weatherData, timezoneData];
  }

  Future<dynamic> getTypedCityData(String cityName) async {
    Network network = Network(
        "http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$openWeatherAppId&units=metric");
    var weatherData = await network.getWeatherData();
    TimeZone timeZone = TimeZone(
        "https://api.opencagedata.com/geocode/v1/json?q=$cityName&key=$worldTimeId");
    var timezoneData = await timeZone.getTimeData();

    return [weatherData, timezoneData];
  }
}
