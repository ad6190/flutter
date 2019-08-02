import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionLayout extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransactionController;

  TransactionLayout(this.transactions, this.deleteTransactionController);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    'Add expenses to track them.',
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColorLight),
                  )
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 6,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Theme.of(context).accentColor,
                          )),
                          child: Text(
                              'INR ${transactions[index].amount.toStringAsFixed(2)}'),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${transactions[index].title}',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                DateFormat.yMMMMEEEEd()
                                    .format(transactions[index].dateTime),
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => deleteTransactionController(transactions[index].id),
                        )
                      ],
                    ),
                  );
                },
                itemCount: transactions.length));
  }
}
