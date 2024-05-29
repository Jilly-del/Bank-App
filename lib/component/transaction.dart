import 'package:flutter/material.dart';
import 'package:jilly_bank/utilities/themestyle.dart';
import 'package:jilly_bank/widget/transactioncard.dart';

class RecentTransaction extends StatefulWidget {
  const RecentTransaction({super.key, required this.acct});
  final Map<String, dynamic> acct;

  @override
  State<RecentTransaction> createState() => _RecentTransactionState();
}

class _RecentTransactionState extends State<RecentTransaction> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, bottom: 16, top: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Transaction',
                  style: ThemeStles.primaryTitle,
                ),
                Text(
                  'See All',
                  style: ThemeStles.seeAll,
                )
              ],
            ),
          ),
          Flexible(
              flex: 1,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  TransactionCard(
                    acct: widget.acct,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
