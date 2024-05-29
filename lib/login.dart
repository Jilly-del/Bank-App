import 'package:jilly_bank/data/accounts.dart';
import 'package:jilly_bank/homepage.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var usernameController = TextEditingController();
  var pinController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    pinController.dispose();
    super.dispose();
  }

  late Map<String, dynamic> currentAccount;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Column(children: [
          const Image(
            image: AssetImage('logo.png'),
            height: 200,
            width: 300,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: TextField(
              controller: usernameController,
              maxLength: 3,
              decoration: InputDecoration(
                label: Row(children: const [
                  Icon(Icons.person),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Username')
                ]),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: TextField(
              controller: pinController,
              maxLength: 4,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Row(children: const [
                  Icon(Icons.lock),
                  SizedBox(
                    width: 20,
                  ),
                  Text('PIN')
                ]),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                String enteredUsername = usernameController.text;
                var enteredPin = int.tryParse(pinController.text);

                currentAccount = accounts
                    .firstWhere((acc) => acc['username'] == enteredUsername);

                if (currentAccount['username'] == enteredUsername &&
                    currentAccount['pin'] == enteredPin) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home(
                                acct: currentAccount,
                              )));
                  // clear Input Field
                  usernameController.clear();
                  pinController.clear();
                } else {
                  // Show Dialog for incorrect inputs
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            title: const Icon(Icons.cancel_rounded, size: 60),
                            content: const Text(
                              'Invalid Usename/Password',
                              style: TextStyle(color: Colors.white),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(ctx);
                                  },
                                  child: const Text('okay'))
                            ],
                          ));
                  usernameController.clear();
                  pinController.clear();
                }
              },
              child: const Text('login '))
        ]),
      ),
    );
  }
}
