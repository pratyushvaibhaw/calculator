import 'package:flutter/material.dart';

class ButtonData {
  List<Map<String, dynamic>> buttonData() {
    return _listButtonData;
  }

  List<Map<String, dynamic>> _listButtonData = [
    {
      'data': 'C',
      'color': Colors.lightBlue.shade100,
      'font_color': Colors.black
    },
    {'data': 'DEL', 'color': Colors.red, 'font_color': Colors.white},
    {'data': '%', 'color': Colors.orange.shade400, 'font_color': Colors.white},
    {'data': '/', 'color': Colors.orange.shade400, 'font_color': Colors.white},
    {'data': '9', 'color': Colors.white, 'font_color': Colors.black},
    {'data': '8', 'color': Colors.white, 'font_color': Colors.black},
    {'data': '7', 'color': Colors.white, 'font_color': Colors.black},
    {'data': 'X', 'color': Colors.orange.shade400, 'font_color': Colors.white},
    {'data': '6', 'color': Colors.white, 'font_color': Colors.black},
    {'data': '5', 'color': Colors.white, 'font_color': Colors.black},
    {'data': '4', 'color': Colors.white, 'font_color': Colors.black},
    {'data': '-', 'color': Colors.orange.shade400, 'font_color': Colors.white},
    {'data': '3', 'color': Colors.white, 'font_color': Colors.black},
    {'data': '2', 'color': Colors.white, 'font_color': Colors.black},
    {'data': '1', 'color': Colors.white, 'font_color': Colors.black},
    {'data': '+', 'color': Colors.orange.shade400, 'font_color': Colors.white},
    {'data': '0', 'color': Colors.white, 'font_color': Colors.black},
    {'data': '.', 'color': Colors.white, 'font_color': Colors.black},
    {
      'data': '^',
      'color': Colors.white,
      'font_color': Color.fromARGB(255, 21, 40, 0)
    },
    {'data': '=', 'color': Colors.orange.shade400, 'font_color': Colors.white},
  ];
}
