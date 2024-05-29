import 'package:flutter/material.dart';
import 'package:jilly_bank/utilities/themestyle.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(150, 40, 50, 50),
        child: Row(
          children: [
            Text(
              'Settings',
              style: ThemeStles.primaryTitle,
            ),
            const SizedBox(
              width: 20,
            ),
            const Icon(Icons.settings),
          ],
        ),
      ),
    );
  }
}
