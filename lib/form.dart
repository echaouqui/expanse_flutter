import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final inputTitle = TextEditingController();
  final inputAmount = TextEditingController();

  final Function addTransaction;

  TransactionForm(this.addTransaction);

  void submitData() {
    String title = inputTitle.text;
    double amount = double.parse(inputAmount.text);

    if (title.isEmpty || amount <= 0) {
      return;
    }

    addTransaction(
      title: title,
      amount: amount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "title"),
              controller: inputTitle,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "amount"),
              controller: inputAmount,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              onPressed: submitData,
              child: Text("add transaction"),
              style: TextButton.styleFrom(
                primary: Colors.purple,
                onSurface: Colors.purple,
              ),
            )
          ],
        ),
      ),
    );
  }
}
