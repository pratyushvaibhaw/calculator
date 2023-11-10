import 'package:calcsi/res/dimensions.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Map<String, dynamic> list;
  RoundedButton({required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              // color: list['color'],
              color: Colors.black,
              offset: AppDimension.offset,
              blurRadius: AppDimension.blur,
            ),
            BoxShadow(
              color: list['color'],
              offset: -AppDimension.offset,
              blurRadius: AppDimension.blur,
            ),
          ],
          shape: BoxShape.rectangle,
          color: list['color'],
          borderRadius: BorderRadius.circular(AppDimension.containerradius)),
      child: Center(
        child: Text(
          list['data'],
          style: TextStyle(
              fontFamily: 'font_one', fontSize: 20, color: list['font_color']),
        ),
      ),
    );
  }
}
