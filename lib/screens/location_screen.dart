import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/rendering.dart';
import 'city_screen.dart';
import 'dart:core';
import 'package:intl/intl.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();

  int temp;
  String weatherIcon;
  String cityname;
  String weatherMessage;
  String wetIcon;
  String weatherCondition;
  var localDate = 0;
  int condition;
  var humidity;
  var wind;
  var pressure;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temp = 0;
        cityname = 'City Not Found';
        wetIcon = '';
        weatherCondition = '';
        localDate = 0;
        humidity = 0;
        wind = 0;
        pressure = 0;
        return;
      }

      condition = weatherData['weather'][0]['id'];
      temp = (weatherData['main']['temp']).toInt();
      cityname = weatherData['name'];
      wetIcon = weatherData['weather'][0]['icon'];
      weatherCondition = weatherData['weather'][0]['main'];
      localDate = weatherData['dt'];
      humidity = weatherData['main']['humidity'];
      wind = weatherData['wind']['speed'];
      pressure = weatherData['main']['pressure'];
    });
  }

  final Map<String, AssetImage> images = {
    "Thunderstorm": AssetImage("images/thunderstorm.jpg"),
    "Drizzle": AssetImage("images/drizzle.jpg"),
    "Rain": AssetImage("images/rain.jpg"),
    "Snow": AssetImage("images/snow.jpg"),
    "Mist": AssetImage("images/mist.jpg"),
    "Clear": AssetImage("images/clear_day.jpg"),
    "Clouds": AssetImage("images/clouds.jpg"),
    "ClearNight": AssetImage("images/clear_night.jpg")
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: wetIcon == "01n"
                ? images["ClearNight"]
                : ((condition >= 700 && condition <= 799)
                    ? images["Mist"]
                    : (cityname == '' || weatherCondition == '')
                        ? images["Mist"]
                        : images[weatherCondition]),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.9),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15.0, left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        onPressed: () async {
                          var weatherData = await weather.getLocationWeather();
                          updateUI(weatherData);
                        },
                        icon: Icon(
                          Icons.my_location,
                        ),
                        iconSize: 40.0,
                      ),
                      IconButton(
                        onPressed: () async {
                          var typeName = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CityScreen();
                              },
                            ),
                          );
                          if (typeName != null) {
                            var weatherData =
                                await weather.getCityWeather(typeName);
                            updateUI(weatherData);
                          }
                        },
                        icon: Icon(
                          Icons.search,
                        ),
                        iconSize: 40.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 15.0, left: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$cityname".toUpperCase(),
                        style: kMessageTextStyle,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        localDate != 0
                            ? DateFormat.yMMMEd()
                                .format(DateTime.fromMillisecondsSinceEpoch(
                                        localDate * 1000)
                                    .toLocal())
                                .toString()
                            : 'DD-MM-YYYY',
                        style: kDateTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15.0, left: 15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '$temp°',
                            style: kTempTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          wetIcon != ''
                              ? Image.network(
                                  "https://openweathermap.org/img/wn/$wetIcon@2x.png",
                                  fit: BoxFit.cover,
                                  color: Colors.white,
                                  height: 60.0,
                                  width: 60.0,
                                )
                              : Icon(
                                  Icons.hourglass_empty,
                                ),
                          Text(
                            "$weatherCondition",
                            textAlign: TextAlign.center,
                            style: kWeatherConditionTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15.0, left: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Humidity",
                                  textAlign: TextAlign.center,
                                  style: kWeatherConditionTextStyleKey,
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  "$humidity",
                                  textAlign: TextAlign.center,
                                  style: kWeatherConditionTextStyleValue,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "%",
                                  textAlign: TextAlign.center,
                                  style: kWeatherConditionTextStyleUnits,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Wind",
                                  textAlign: TextAlign.center,
                                  style: kWeatherConditionTextStyleKey,
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  (wind * 3.6).toStringAsFixed(2).toString(),
                                  textAlign: TextAlign.center,
                                  style: kWeatherConditionTextStyleValue,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "km/h",
                                  textAlign: TextAlign.center,
                                  style: kWeatherConditionTextStyleUnits,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Pressure",
                                  textAlign: TextAlign.center,
                                  style: kWeatherConditionTextStyleKey,
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  (pressure * 0.75 * 0.04)
                                      .toStringAsFixed(2)
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  style: kWeatherConditionTextStyleValue,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "Hg",
                                  textAlign: TextAlign.center,
                                  style: kWeatherConditionTextStyleUnits,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
