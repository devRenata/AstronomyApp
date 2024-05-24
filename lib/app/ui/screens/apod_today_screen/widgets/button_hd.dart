import 'package:astronomy/assets/colors/custom_colors.dart';
import 'package:flutter/material.dart';

Widget buttonHd() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 200,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: CustomColors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: <Widget>[
                const Icon(
                  Icons.hd,
                  color: Colors.white,
                ),
                Text(
                  'Image in HD',
                  style: TextStyle(
                    color: CustomColors.white,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
