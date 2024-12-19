import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQr extends StatefulWidget {
  const GenerateQr({super.key});

  @override
  State<GenerateQr> createState() => _GenerateQrState();
}

class _GenerateQrState extends State<GenerateQr> {
  TextEditingController textController = TextEditingController();
  String qrData = ''; // Store the text for the QR code here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                hintText: 'Enter text to convert to QR',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blueAccent,
              ),
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  if (textController.text.isNotEmpty) {
                    setState(() {
                      qrData = textController.text;
                    });
                  }
                },
                child: const Text('Generate QR',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
            const SizedBox(height: 16),
            if (qrData.isNotEmpty) // Show QR code only if there's data
              QrImageView(
                data: qrData,
                size: 200,
              ),
          ],
        ),
      ),
    );
  }
}
