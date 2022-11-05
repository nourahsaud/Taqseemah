// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Saving extends StatelessWidget {
  const Saving({Key? key}) : super(key: key);

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Color.fromRGBO(0, 60, 79, 1),
                    size: 24,
                  ),
                  onPressed: () {},
                ),
              ),
              Text(
                'أهدافي',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromRGBO(0, 60, 79, 1),
                  //fontFamily:
                ),
              ),
            ],
          ),
          SizedBox(
            height: 350,
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '500,000',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color.fromRGBO(0, 60, 79, 1),
                                //fontFamily:
                              ),
                            ),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  'أهدافي',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color.fromRGBO(0, 60, 79, 1),
                                    //fontFamily:
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    Icons.heart_broken,
                                    color: Color.fromRGBO(0, 60, 79, 1),
                                    size: 24,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      LinearPercentIndicator(
                        animation: true,
                        animationDuration: 2000,
                        lineHeight: 20,
                        percent: 0.7,
                        barRadius: const Radius.circular(16),
                        progressColor: Colors.blue[400],
                        backgroundColor: Colors.grey[300],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '400,000',
                          ),
                        ),
                      ),
                      ElevatedButton(onPressed: () {}, child: Text('add')),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '500,000',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color.fromRGBO(0, 60, 79, 1),
                                //fontFamily:
                              ),
                            ),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  'أهدافي',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color.fromRGBO(0, 60, 79, 1),
                                    //fontFamily:
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    Icons.heart_broken,
                                    color: Color.fromRGBO(0, 60, 79, 1),
                                    size: 24,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      LinearPercentIndicator(
                        animation: true,
                        animationDuration: 2000,
                        lineHeight: 20,
                        percent: 0.7,
                        barRadius: const Radius.circular(16),
                        progressColor: Colors.blue[400],
                        backgroundColor: Colors.grey[300],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '400,000',
                          ),
                        ),
                      ),
                      ElevatedButton(onPressed: () {}, child: Text('add')),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '500,000',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color.fromRGBO(0, 60, 79, 1),
                                //fontFamily:
                              ),
                            ),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  'أهدافي',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color.fromRGBO(0, 60, 79, 1),
                                    //fontFamily:
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    Icons.heart_broken,
                                    color: Color.fromRGBO(0, 60, 79, 1),
                                    size: 24,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      LinearPercentIndicator(
                        animation: true,
                        animationDuration: 2000,
                        lineHeight: 20,
                        percent: 0.7,
                        barRadius: const Radius.circular(16),
                        progressColor: Colors.blue[400],
                        backgroundColor: Colors.grey[300],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '400,000',
                          ),
                        ),
                      ),
                      ElevatedButton(onPressed: () {}, child: Text('add')),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '500,000',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color.fromRGBO(0, 60, 79, 1),
                                //fontFamily:
                              ),
                            ),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  'أهدافي',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color.fromRGBO(0, 60, 79, 1),
                                    //fontFamily:
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    Icons.heart_broken,
                                    color: Color.fromRGBO(0, 60, 79, 1),
                                    size: 24,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      LinearPercentIndicator(
                        animation: true,
                        animationDuration: 2000,
                        lineHeight: 20,
                        percent: 0.7,
                        barRadius: const Radius.circular(16),
                        progressColor: Colors.blue[400],
                        backgroundColor: Colors.grey[300],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '400,000',
                          ),
                        ),
                      ),
                      ElevatedButton(onPressed: () {}, child: Text('add')),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '500,000',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color.fromRGBO(0, 60, 79, 1),
                                //fontFamily:
                              ),
                            ),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  'أهدافي',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color.fromRGBO(0, 60, 79, 1),
                                    //fontFamily:
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    Icons.heart_broken,
                                    color: Color.fromRGBO(0, 60, 79, 1),
                                    size: 24,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      LinearPercentIndicator(
                        animation: true,
                        animationDuration: 2000,
                        lineHeight: 20,
                        percent: 0.7,
                        barRadius: const Radius.circular(16),
                        progressColor: Colors.blue[400],
                        backgroundColor: Colors.grey[300],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '400,000',
                          ),
                        ),
                      ),
                      ElevatedButton(onPressed: () {}, child: Text('add')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
