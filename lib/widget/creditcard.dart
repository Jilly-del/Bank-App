import 'package:flutter/material.dart';
import 'package:jilly_bank/utilities/themecolor.dart';
import 'package:jilly_bank/utilities/themestyle.dart';
import 'package:jilly_bank/data/accounts.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({super.key, required this.acct});
  final Map<String, dynamic> acct;

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  var transferuserController = TextEditingController();
  var transferAmountController = TextEditingController();
  var loanAmountController = TextEditingController();

  late List<num> movements = List<num>.from(widget.acct['movements']);
  late num availableBalance =
      movements.fold(0, (previousValue, element) => previousValue + element);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 150,
        width: 380,
        decoration: BoxDecoration(
            color: ThemeColor.green, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        'Available Balance',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(width: 15),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                availableBalance.toString(),
                style: ThemeStles.cardMoney,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              // isControlled is used to make show modal bottom sheet cover the whole screen
                              isScrollControlled: true,
                              context: context,
                              builder: (ctx) => SizedBox(
                                height: 400,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(children: [
                                    Text(
                                      'Transfer',
                                      style: ThemeStles.primaryTitle,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            height: 50,
                                            child: TextField(
                                              controller:
                                                  transferuserController,
                                              decoration: const InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white,
                                                hintText: 'Transfer to',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(15),
                                                    ),
                                                    borderSide: BorderSide(
                                                        color: Colors.white)),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          SizedBox(
                                            width: 150,
                                            height: 50,
                                            child: TextField(
                                              controller:
                                                  transferAmountController,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: const InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white,
                                                hintText: 'Amount',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(15),
                                                    ),
                                                    borderSide: BorderSide(
                                                        color: Colors.white)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          var transfer = accounts.firstWhere(
                                              (user) =>
                                                  user['username'] ==
                                                  transferuserController.text);
                                          var amount = int.parse(
                                              transferAmountController.text);

                                          if (transfer != widget.acct &&
                                              amount > 0 &&
                                              amount <= availableBalance) {
                                            var receiver =
                                                transfer['movements'] as List;
                                            receiver.add(amount);
                                            setState(() {
                                              availableBalance -= amount;
                                            });

                                            transferAmountController.clear();
                                            transferuserController.clear();
                                          } else {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: const Text(
                                                  ' Invalid Username/ Low Balance',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                                content: const Text(
                                                  'Provide a valid username or top up your account',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text(
                                                        'okay',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ))
                                                ],
                                                alignment: Alignment.center,
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        150, 255, 88, 95),
                                              ),
                                            );
                                            transferAmountController.clear();
                                            transferuserController.clear();
                                          }
                                        },
                                        child: Text(
                                          'Send',
                                          style: ThemeStles.primaryTitle,
                                        ))
                                  ]),
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.tab,
                            color: Colors.white,
                          )),
                      const Text(
                        'Transfer',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.call,
                            color: Colors.white,
                          )),
                      const Text(
                        'Call',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.settings,
                            color: Colors.white,
                          )),
                      const Text(
                        'Settings',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
