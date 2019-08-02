import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './chartbar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (idx) {
      final weekDay = DateTime.now().subtract(
        Duration(days: idx),
      );

      double totalSum = 0.0;
      for (var i in recentTransactions) {
        if (i.dateTime.day == weekDay.day &&
            i.dateTime.month == weekDay.month &&
            i.dateTime.year == weekDay.year) {
          totalSum += i.amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return groupedTransactions.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactions.map((data) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
              data['day'],
              data['amount'],
              maxSpending != 0.0
                  ? (data['amount'] as double) / maxSpending
                  : 0,
            ),
          );
        }).toList()));
  }
}
