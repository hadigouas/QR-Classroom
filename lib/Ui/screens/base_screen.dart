import 'package:flutter/material.dart';
import 'package:steam_regestration_system/Ui/screens/qr_scanner.dart';
import 'package:steam_regestration_system/consts/consts.dart';
import 'package:steam_regestration_system/consts/mytext.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();

    // Formatting the date as a string
    String formattedDate = "${today.year}/${today.month}/${today.day}";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mysecond,
        title: const Mytext(
          text: 'School attendance system',
          bold: true,
        ),
        centerTitle: true,
      ),
      backgroundColor: mygreen,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const QrScannerWidget(),
                              ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blueAccent[700],
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(width: 2, color: Colors.white)),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Mytext(
                              text: 'add student',
                              color: Colors.white,
                              bold: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: DataTable(
                      headingRowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.blue[200]!),
                      dataRowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      border: TableBorder.all(
                          borderRadius: BorderRadius.circular(10)),
                      columns: const [
                        DataColumn(
                            label: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Mytext(
                            text: 'Student',
                            bold: true,
                          ),
                        )),
                        DataColumn(
                            label: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Mytext(
                            text: 'attendance',
                            bold: true,
                          ),
                        )),
                      ],
                      rows: const [],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue[200],
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Mytext(
                          text: formattedDate,
                          bold: true,
                        ),
                      ),
                    ),
                  ]),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue[200],
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Mytext(
                          text: 'submit',
                          bold: true,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
