import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:taqseemah/view/widgets/saving.dart';

import 'expenses_list.dart';



class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
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
              child: ExpensesList(),
            ),
          ],
        ));
  }
}
