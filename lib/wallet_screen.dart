import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({Key? key}) : super(key: key);

  double depositedAmount = 9999.76543;
  double winningAmount = 45085.65456;
  double cashBonusAmount = 2000.56776544;
  double get totalBalanceAmount =>
      depositedAmount + winningAmount + cashBonusAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Balance'),
          backgroundColor: Colors.black,
        ),
        body: Column(children: [
          SizedBox(
              height: 360,
              width: 400,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8.0, right: 8, left: 8),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text('Total Balance')],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '₹ ${double.parse(totalBalanceAmount.toStringAsFixed(2))}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                debugPrint('add money');
                              },
                              style: ButtonStyle(
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                  const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                      bottomLeft: Radius.circular(30),
                                      topLeft: Radius.circular(30),
                                    ),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                              ),
                              child: const Text('Add Money'),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 8, right: 8.0, left: 7.0, bottom: 8),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                        color: Colors.black38,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                )),
                            const Row(
                              children: [
                                Text(
                                  'Deposited',
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  '₹ ${double.parse(depositedAmount.toStringAsFixed(2))}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 8, right: 8.0, left: 7.0, bottom: 8),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                        color: Colors.grey,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                )),
                            const Row(
                              children: [
                                Text(
                                  'Winnings',
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  '₹ ${double.parse(winningAmount.toStringAsFixed(2))}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                debugPrint('withdraw');
                              },
                              style: ButtonStyle(
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                  const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(25),
                                      bottomRight: Radius.circular(25),
                                      bottomLeft: Radius.circular(25),
                                      topLeft: Radius.circular(25),
                                    ),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                              ),
                              child: const Text('Withdraw'),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 8, right: 8.0, left: 7.0, bottom: 8),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                        color: Colors.grey,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                )),
                            const Row(
                              children: [
                                Text(
                                  'Cash Bonus',
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  '₹ ${double.parse(cashBonusAmount.toStringAsFixed(2))}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          GestureDetector(
            child: SizedBox(
                height: 80,
                width: 400,
                child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'My Recent Transaction',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          ),
                        )))),
            onTap: () => debugPrint('Transaction History'),
          ),
          GestureDetector(
            child: SizedBox(
                height: 80,
                width: 400,
                child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'KYC Details',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.arrow_forward_ios_rounded)
                                ],
                              ),
                              Row(
                                children: [
                                  Text('view Mobile, PAN, Bank Details')
                                ],
                              )
                            ],
                          ),
                        )))),
            onTap: () => debugPrint('KYC'),
          ),
          GestureDetector(
            child: SizedBox(
                height: 80,
                width: 400,
                child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Refer and Earn',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          ),
                        )))),
            onTap: () => debugPrint('Refer and Earn'),
          ),
        ]));
  }
}
