import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steam_regestration_system/Ui/screens/presence_Screen.dart';
import 'package:steam_regestration_system/Ui/screens/qr_scanner.dart';
import 'package:steam_regestration_system/Ui/screens/widgets/mydata_table.dart';
import 'package:steam_regestration_system/consts/consts.dart';
import 'package:steam_regestration_system/consts/mytext.dart';
import 'package:steam_regestration_system/logic/Checkingattendance/cubit/checking_attendance_cubit.dart';
import 'package:steam_regestration_system/logic/adding_student.dart/cubit/add_student_cubit.dart';

class AfterScanning extends StatelessWidget {
  AfterScanning({super.key, required this.state, required this.mystudents});
  AddStudentState state;
  List mystudents;

  List<Widget> alltable = [];

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
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Center(
                      //     child: Image.asset(
                      //   'assets/images/logo.png',
                      //   height: 150,
                      // )),
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
                      const SizedBox(
                        height: 15,
                      ),
                      MydataTable(mystudents: mystudents, state: state),
                    ],
                  ),
                ),
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
                    onTap: () {
                      BlocProvider.of<CheckingAttendanceCubit>(context)
                          .thefinallist(mystudents);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PresenceScreen(),
                          ));
                    },
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
