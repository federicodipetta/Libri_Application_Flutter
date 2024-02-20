import 'package:flutter/material.dart';

class QRScanner extends StatelessWidget {
  const QRScanner({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(children: [
            Expanded(
              flex: 4,
              child: Container(color: Colors.green),
            ),
            Expanded(
              child: Container(
                color: Colors.amber,
              ),
            )
          ])),
    );
  }
}
