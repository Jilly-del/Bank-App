import 'package:flutter/material.dart';
import 'package:jilly_bank/utilities/themestyle.dart';

class Call extends StatelessWidget {
  const Call({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(150, 40, 50, 50),
        child: Row(
          children: [
            Text(
              'Call',
              style: ThemeStles.primaryTitle,
            ),
            const SizedBox(
              width: 20,
            ),
            const Icon(Icons.call),
          ],
        ),
      ),
    );
  }
}
