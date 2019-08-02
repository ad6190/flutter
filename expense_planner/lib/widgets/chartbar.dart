import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spending;
  final double spendingpct;

  ChartBar(
    this.label,
    this.spending,
    this.spendingpct,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(child: Text('${spending.toStringAsFixed(0)}')),
        SizedBox(
          height: 4,
        ),
        Container(
            height: 60,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).accentColor,
                      width: 1.0,
                    ),
//                    color: Theme.of(context).,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingpct,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            )),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
