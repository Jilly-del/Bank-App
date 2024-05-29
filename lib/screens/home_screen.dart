import 'package:flutter/material.dart';
import 'package:jilly_bank/component/appbar.dart';
import 'package:jilly_bank/component/cards.dart';
import 'package:jilly_bank/component/transaction.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.acct});
  final Map<String, dynamic> acct;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            const Appbar(),
            CardsList(acct: widget.acct),
            RecentTransaction(
              acct: widget.acct,
            )
          ],
        ),
      ),
    );
  }
}
