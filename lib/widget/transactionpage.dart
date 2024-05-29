import 'package:flutter/material.dart';
import 'package:jilly_bank/widget/transactioncard.dart';
import 'package:jilly_bank/utilities/themestyle.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key, required this.acct});
  final Map<String, dynamic> acct;

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sent'),
        backgroundColor: const Color.fromARGB(255, 104, 185, 132),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Container(
        child: Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        'Total Transaction',
                        style: ThemeStles.primaryTitle,
                      ),
                      TransactionCard(
                        acct: widget.acct,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
