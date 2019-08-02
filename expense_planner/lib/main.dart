import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/input_transaction.dart';
import './widgets/chart.dart';

void main() {
  runApp(ExpenseTrackerApp());
}

class ExpenseTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      home: HomePage(),
      theme: new ThemeData(
        brightness: Brightness.dark,                        // new
      ),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Transaction> transactions = [
//    Transaction(id: '1', title: 'Bag', amount: 50, dateTime: DateTime.now()),
//    Transaction(id: '2', title: 'Coffee', amount: 10, dateTime: DateTime.now()),
//    Transaction(id: '3', title: 'Soap', amount: 12, dateTime: DateTime.now())
  ];

  void addNewTransaction(String title, double amount, DateTime selectedDate) {
    final newTx = Transaction(
      title: title,
      amount: amount,
      dateTime: selectedDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      transactions.add(newTx);
    });
  }

  void deleteTransaction(String id){
    setState(() {
      return transactions.removeWhere((tx) => tx.id == id);
    });
  }

  void startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_) {
      return GestureDetector(
          onTap: () {},
          child: InputLayout(addNewTransaction),
          behavior: HitTestBehavior.opaque,
      );
    });
  }

  List<Transaction> get recentTransactions{
    return transactions.where((el) {
      return el.dateTime.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => startAddNewTransaction(context),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Chart(recentTransactions),
          TransactionLayout(transactions, deleteTransaction),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
