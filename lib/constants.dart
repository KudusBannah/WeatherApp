import 'package:flutter/material.dart';

const kCityTextStyleDay = TextStyle(
  fontSize: 40.0,
  fontFamily: "Roboto",
  fontWeight: FontWeight.w100,
  color: Color(0xFF787D85),
);

const kCityTextStyleNight = TextStyle(
  fontSize: 40.0,
  fontFamily: "Roboto",
  fontWeight: FontWeight.w100,
  color: Color(0xFFCBD1D8),
);

const kDateStyleDay = TextStyle(
  letterSpacing: 2.0,
  fontSize: 20.0,
  fontFamily: "Roboto",
  fontWeight: FontWeight.bold,
  color: Color(0xFF787D85),
);

const kDateStyleNight = TextStyle(
  letterSpacing: 2.0,
  fontSize: 20.0,
  fontFamily: "Roboto",
  fontWeight: FontWeight.w500,
  color: Color(0xFFCBD1D8),
);

const kTempTextStyleDay = TextStyle(
  letterSpacing: 2.0,
  fontFamily: "Roboto",
  fontSize: 45.0,
  color: Color(0xFF343A42),
);

const kTempTextStyleNight = TextStyle(
  letterSpacing: 2.0,
  fontFamily: "Roboto",
  fontSize: 45.0,
  color: Colors.white,
);

const kGreetingTextStyleDay = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.0,
  color: Color(0xFF787D85),
);

const kGreetingTextStyleNight = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.0,
  color: Color(0xFFCBD1D8),
);

const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
    size: 30,
  ),
  hintText: "Enter city name",
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);

const kButtonTextStyle = TextStyle(
  fontSize: 35.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontFamily: 'Spartan',
);

const kDayBackgroundColor = Color(0xFFDCE3EA);
const kNightBackgroundColor = Color(0xFF2F3542);

const kNightImage = "images/night.png";
const kDayImage = "images/day.png";
