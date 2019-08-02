import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputLayout extends StatefulWidget {
  final Function addTransactionController;
  InputLayout(this.addTransactionController);

  @override
  _InputLayoutState createState() => _InputLayoutState();
}

class _InputLayoutState extends State<InputLayout> {
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();

  DateTime selectedDate;

  void addTx() {
    String enteredTitle = titleInput.text;
    double enteredAmount = double.parse(amountInput.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || selectedDate == null) {
      return;
    }
    widget.addTransactionController(enteredTitle, enteredAmount, selectedDate);
    Navigator.of(context).pop();
  }

  void datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
//        color: Colors.pink[50],
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Item name'),
              controller: titleInput,
              keyboardType: TextInputType.text,
              onSubmitted: (_) => addTx(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountInput,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => addTx(),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    selectedDate == null
                        ? 'No date chosen!'
                        : 'Picked date: ${DateFormat.yMd().format(selectedDate)}',
                  ),
                ),
                FlatButton(
                  child: Text(
                    'Choose date',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  onPressed: datePicker,
                )
              ],
            ),
            RaisedButton(
                color: Theme.of(context).accentColor,
                child: Container(
                    child: Text(
                  'Add Transaction',
                  style: TextStyle(color: Theme.of(context).primaryColorDark),
                )),
                onPressed: addTx)
          ],
        ),
      ),
    );
  }
}
