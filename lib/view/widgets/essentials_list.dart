import 'package:flutter/material.dart';

import '../../constance.dart';

class EssentialsList extends StatelessWidget {
  const EssentialsList({Key? key}) : super(key: key);
  //khairiah
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 16,
            color: GreyColor2,
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
                    color: DarkColor1,
                    size: 24,
                  ),
                  onPressed: () {},
                ),
              ),
              Text(
                'التزامات',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: DarkColor1,
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
                                color: DarkColor1,
                                //fontFamily:
                              ),
                            ),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  'فاتورة كهربا',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: DarkColor1,
                                    //fontFamily:
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    Icons.heart_broken,
                                    color: DarkColor1,
                                    size: 24,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '2022/2/3',
                          ),
                        ),
                      ),

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
                                color: DarkColor1,
                                //fontFamily:
                              ),
                            ),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  'ايجار البيت',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: DarkColor1,
                                    //fontFamily:
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    Icons.heart_broken,
                                    color: DarkColor1,
                                    size: 24,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '2022/2/3',
                          ),
                        ),
                      ),

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
                                color: DarkColor1,
                                //fontFamily:
                              ),
                            ),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  'قسط السياره',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: DarkColor1,
                                    //fontFamily:
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    Icons.heart_broken,
                                    color: DarkColor1,
                                    size: 24,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '2022/2/3',
                          ),
                        ),
                      ),

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
