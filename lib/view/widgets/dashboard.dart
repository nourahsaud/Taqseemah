import 'package:flutter/material.dart';
import 'package:taqseemah/view/widgets/chart.dart';
import 'package:taqseemah/view/widgets/saving.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
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
          child: Chart(),
        ),
        Container(
          child: Saving(),
        ),
      ],
    ));
  }
}
