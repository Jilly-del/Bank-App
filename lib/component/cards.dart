import 'package:flutter/material.dart';
import 'package:jilly_bank/widget/creditcard.dart';

class CardsList extends StatefulWidget {
  const CardsList({super.key, required this.acct});
  final Map<String, dynamic> acct;

  @override
  State<CardsList> createState() => _CardsListState();
}

class _CardsListState extends State<CardsList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCard(acct: widget.acct),
      ],
    );
  }
}
