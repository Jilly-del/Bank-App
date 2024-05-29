import 'package:flutter/material.dart';
import 'package:jilly_bank/screens/home_screen.dart';
import 'package:jilly_bank/widget/transactionpage.dart';
import 'package:jilly_bank/widget/call.dart';
import 'package:jilly_bank/widget/setting.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.acct});
  final Map<String, dynamic> acct;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Map<String, dynamic> account;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Initialize the 'acct' variable in initState
    account = widget.acct;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = <Widget>[
      HomeScreen(acct: account),
      TransactionPage(
        acct: account,
      ),
      const Call(),
      const Setting(),
    ];

    void onTabTapped(index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return Scaffold(
      body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          elevation: 0,
          currentIndex: selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: onTabTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.payment), label: 'transaction'),
            BottomNavigationBarItem(icon: Icon(Icons.call), label: 'call'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'settings'),
          ]),
    );
  }
}
