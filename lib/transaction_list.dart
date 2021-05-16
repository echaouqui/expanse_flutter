import 'package:flutter/material.dart';

import './form.dart';
import './transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({Key key}) : super(key: key);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  List<Transaction> transactions = [
    Transaction(
        id: "t1", title: "New Shoes", amount: 22.50, date: DateTime.now()),
    Transaction(
        id: "t2", title: "New Phone", amount: 150, date: DateTime.now()),
  ];

  void _addNewTransaction({String title, double amount}) {
    final transaction = new Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());
    setState(() {
      transactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(_addNewTransaction),
        Container(
          height: 300,
          child: ListView.builder(
            itemBuilder: (context, index) {
              Transaction item = transactions[index];
              return TransactionItem(
                item: item,
              );
            },
            itemCount: transactions.length,
          ),
        ),
      ],
    );
  }
}
