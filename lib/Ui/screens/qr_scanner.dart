import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:steam_regestration_system/logic/adding_student.dart/cubit/add_student_cubit.dart';
import 'package:steam_regestration_system/modules/student_module.dart';

class QrScannerWidget extends StatefulWidget {
  const QrScannerWidget({super.key});

  @override
  _QrScannerWidgetState createState() => _QrScannerWidgetState();
}

class _QrScannerWidgetState extends State<QrScannerWidget> {
  late QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isQRCodeDetected = false;
  @override
  Widget build(BuildContext context) {
    return QRView(
      key: qrKey,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: 300,
      ),
      onQRViewCreated: _onQRViewCreated,
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!isQRCodeDetected) {
        // Use the complete string from scanData.code
        String fullCode = scanData.code!.trim();

        BlocProvider.of<AddStudentCubit>(context)
            .addsutdent(Student(fullname: fullCode, present: true));
        setState(() {
          isQRCodeDetected = true;
        });

        controller.dispose();
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
