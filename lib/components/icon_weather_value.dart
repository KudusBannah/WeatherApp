import 'package:flutter/material.dart';

class IconWeatherColumn extends StatelessWidget {
  const IconWeatherColumn(
      {Key? key, this.icon, this.description, this.value, this.color})
      : super(key: key);

  final IconData? icon;
  final String? description;
  final String? value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 20.0,
          color: color,
        ),
        const SizedBox(height: 5),
        Text(
          "$description",
          style: TextStyle(
            fontSize: 16.0,
            color: color,
          ),
        ),
        Text(
          "$value",
          style: TextStyle(
            fontSize: 20.0,
            color: color,
          ),
        ),
      ],
    );
  }
}
