// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Goals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          BoxShadow(
            blurRadius: 16,
            color: Color.fromRGBO(0, 109, 143, 0.06),
          )
        ],
      ),
      padding: const EdgeInsets.only(top: 4, left: 12, right: 12, bottom: 12),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Color.fromRGBO(0, 60, 79, 1),
                      size: 24,
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  // padding: const EdgeInsets.only(
                  //     top: 8, left: 4, right: 4, bottom: 8),
                  child: Text(
                    'أهدافي',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color.fromRGBO(0, 60, 79, 1),
                      //fontFamily:
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
