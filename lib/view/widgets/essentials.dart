import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'essentials_list.dart';

class Essentials extends StatelessWidget {
  const Essentials({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(8),
          //crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 1,
          children: <Widget>[

            Container(
              child: EssentialsList(),
            ),
          ],
        ));
  }
}
