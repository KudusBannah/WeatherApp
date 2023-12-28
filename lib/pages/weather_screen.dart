import 'package:flutter/material.dart';
import 'package:weather_app/components/icon_weather_value.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/services/weather.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/services/get_day.dart';
import 'package:weather_app/pages/choose_location.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key, this.locationWeather}) : super(key: key);

  final dynamic locationWeather;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherModel weatherModel = WeatherModel();
  int? temperature;
  String? cityName, country, condition;
  String? time, offset, weekday;
  double? wind;
  bool? isDayTime;

  @override
  void initState() {
    updateUI(widget.locationWeather);
    super.initState();
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      try {
        temperature = weatherData[0]['main']['temp'].toInt();
        cityName = weatherData[0]['name'];
        country = weatherData[0]['sys']['country'];
        wind = weatherData[0]['wind']['speed'];
        condition = weatherData[0]['weather'][0]['main'];
        time = weatherData[1]['utc_datetime'];
        offset = weatherData[1]['utc_offset'].substring(0, 3);

        DateTime now = DateTime.parse(time!);
        now = now.add(Duration(hours: int.parse(offset!)));

        weekday = getDay(now.weekday);
        time = DateFormat.jm().format(now);
        isDayTime = now.hour >= 6 && now.hour < 17;
      } catch (e) {
        temperature = 0;
        cityName = "Unknown location";
        country = "";
        condition = "Unknown";
        wind = 0;
        time = "";
        weekday = "Avoid shortforms";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDayTime! ? kDayBackgroundColor : kNightBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButton(
              onPressed: () async {
                String? typedCity = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditLocation(),
                  ),
                );
                if (typedCity != null && typedCity.trim() != "") {
                  var weatherData =
                      await weatherModel.getTypedCityData(typedCity);
                  updateUI(weatherData);
                }
              },
              icon: Icon(
                Icons.location_on,
                size: 30,
                color: isDayTime! ? Colors.grey[800] : Colors.white,
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$cityName",
                            style: isDayTime!
                                ? kCityTextStyleDay
                                : kCityTextStyleNight,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.grey[500],
                            backgroundImage:
                                AssetImage("images/flags/PNG/$country@3x.png"),
                            radius: 20.0,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "$weekday $time",
                            style: isDayTime! ? kDateStyleDay : kDateStyleNight,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Image.asset(isDayTime! ? kDayImage : kNightImage),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      "$temperature°c",
                      style:
                          isDayTime! ? kTempTextStyleDay : kTempTextStyleNight,
                    ),
                    const SizedBox(height: 3.0),
                    Text(
                      isDayTime! ? "GOOD MORNING" : "GOOD EVENING",
                      style: isDayTime!
                          ? kGreetingTextStyleDay
                          : kGreetingTextStyleNight,
                    ),
                    Text(
                      "From $country",
                      style: isDayTime!
                          ? kGreetingTextStyleDay
                          : kGreetingTextStyleNight,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: SizedBox(
                  width: 30.0,
                  child: Divider(
                    color: Colors.grey[400],
                    thickness: 2.0,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: IconWeatherColumn(
                      icon: Icons.sunny,
                      description: "Condition",
                      value: "$condition",
                      color: isDayTime!
                          ? const Color(0xFF5B6169)
                          : const Color(0xFFCBD1D8),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 30,
                    child: const VerticalDivider(
                      thickness: 2,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: IconWeatherColumn(
                      icon: Icons.speed,
                      description: "Wind Speed",
                      value: "${wind}m/s",
                      color: isDayTime!
                          ? const Color(0xFF5B6169)
                          : const Color(0xFFCBD1D8),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 30,
                    child: const VerticalDivider(
                      thickness: 2,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: IconWeatherColumn(
                      icon: Icons.thermostat,
                      description: "Temperature",
                      value: "$temperature°c",
                      color: isDayTime!
                          ? const Color(0xFF5B6169)
                          : const Color(0xFFCBD1D8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
