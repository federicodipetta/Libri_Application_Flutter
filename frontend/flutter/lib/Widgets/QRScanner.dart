import 'package:code/Service/LibriService.dart';
import 'package:code/Widgets/LibreriaHome.dart';
import 'package:code/Widgets/RecensioneHome.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  bool isScanCompleted = false;
  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BarCode Scanner")),
      body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(children: [
            Expanded(
              child: MobileScanner(
                  allowDuplicates: true,
                  onDetect: (barcode, args) {
                    if (!isScanCompleted) {
                      String code = barcode.rawValue ?? '---';
                      isScanCompleted = true;
                      Navigator.pop(context, code);
                    }
                  }),
            ),
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Inquara il BarCode nell'area"),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Lo scanner partirà automaticamente"),
                  ]),
            ),
          ])),
    );
  }
}
