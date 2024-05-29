import 'package:flutter/material.dart';
// import 'package:jilly_bank/utilities/themecolor.dart';
import 'package:jilly_bank/utilities/themestyle.dart';
import 'package:jilly_bank/widget/transactionpage.dart';

class TransactionCard extends StatefulWidget {
  const TransactionCard({super.key, required this.acct});
  final Map<String, dynamic> acct;
  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: widget.acct['movements'].map<Widget>((movement) {
      return Card(
        // color: ThemeColor.lightgreen,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  movement > 0 ? 'Deposit' : 'Withdrawal',
                  style: ThemeStles.otherDetailsPrimary,
                ),
                Row(
                  children: [
                    Text(
                      '\$${movement.toString()}',
                      style: TextStyle(
                          fontSize: 20,
                          color: movement > 0 ? Colors.green : Colors.red),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TransactionPage(
                                  acct: widget.acct,
                                ),
                              ));
                        },
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }).toList());
  }
}
