import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontSize: 45.0,
);

const kWeatherConditionTextStyle = TextStyle(
  fontSize: 25.0,
);

const kDateTextStyle = TextStyle(
  fontSize: 18.0,
);

const kWeatherConditionTextStyleKey = TextStyle(
  fontSize: 18.0,
);

const kWeatherConditionTextStyleValue = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

const kWeatherConditionTextStyleUnits = TextStyle(
  fontSize: 18.0,
);

const kCreditsTag = TextStyle(
  fontSize: 12.0,
);

const kCreditsName = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.bold,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kDecorationTextStyle = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  // icon: Icon(
  //   Icons.location_city,
  //   size: 50.0,
  //   color: Colors.white,
  // ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
    borderSide: BorderSide.none,
  ),
);
