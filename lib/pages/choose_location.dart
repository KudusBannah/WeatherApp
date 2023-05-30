import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'dart:async';

class EditLocation extends StatefulWidget {
  const EditLocation({Key? key}) : super(key: key);

  @override
  State<EditLocation> createState() => _EditLocationState();
}

class _EditLocationState extends State<EditLocation> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kNightBackgroundColor,
      appBar: AppBar(
        backgroundColor: kNightBackgroundColor,
        title: const Text("EAZYWRLD"),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: kTextFieldDecoration,
              onChanged: (value) {
                cityName = value;
              },
            ),
          ),
          TextButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              Timer(const Duration(milliseconds: 400), () {
                Navigator.pop(context, cityName);
              });
            },
            child: const Text(
              'Get Weather',
              style: kButtonTextStyle,
            ),
          ),
          SizedBox(
            width: 100.0,
            height: 100.0,
            child: Image.asset("images/logo.png"),
          )
        ],
      ),
    );
  }
}
