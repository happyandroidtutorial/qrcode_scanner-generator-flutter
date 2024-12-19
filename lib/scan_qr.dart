import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQr extends StatefulWidget {
  const ScanQr({super.key});

  @override
  State<ScanQr> createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {
  String result = 'Scanned result';
  bool isScanning = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code Scanner"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: isScanning
                ? MobileScanner(
                    onDetect: (capture) {
                      final List<Barcode> barcodes = capture.barcodes;
                      for (final barcode in barcodes) {
                        setState(() {
                          result = barcode.rawValue ?? "No Data found in QR";
                          isScanning = false; // Stop scanning after detection
                        });
                      }
                    },
                    onDetectError: (object, stackTrace) {
                      setState(() {
                        result = "Error occurred: $stackTrace";
                        isScanning = false;
                      });
                    },
                  )
                : Center(
                    child: Text(
                      "Scan Complete",
                      style: TextStyle(fontSize: 24, color: Colors.green),
                    ),
                  ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                result,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black87,
            ),
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                setState(() {
                  isScanning = true;
                  result = "Scanning...";
                });
              },
              child: const Text(
                "Rescan",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
