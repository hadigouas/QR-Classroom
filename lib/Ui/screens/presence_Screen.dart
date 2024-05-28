import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steam_regestration_system/consts/consts.dart';
import 'package:steam_regestration_system/consts/mytext.dart';
import 'package:steam_regestration_system/logic/Checkingattendance/cubit/checking_attendance_cubit.dart';
import 'package:steam_regestration_system/logic/excel/excel.dart';

class PresenceScreen extends StatefulWidget {
  const PresenceScreen({
    super.key,
  });

  @override
  State<PresenceScreen> createState() => _PresenceScreenState();
}

class _PresenceScreenState extends State<PresenceScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckingAttendanceCubit, CheckingAttendanceState>(
        builder: (context, state) {
      if (state is TheAttendeedList) {
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
            padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DataTable(
                  dataRowMaxHeight: 55,
                  horizontalMargin: 45,
                  headingRowColor: MaterialStateColor.resolveWith(
                      (states) => Colors.blue[200]!),
                  dataRowColor:
                      MaterialStateColor.resolveWith((states) => Colors.white),
                  border:
                      TableBorder.all(borderRadius: BorderRadius.circular(10)),
                  columns: const [
                    DataColumn(
                      label: Mytext(
                        text: 'Student',
                        bold: true,
                      ),
                    ),
                    DataColumn(
                      label: Mytext(
                        text: 'Attendance',
                        bold: true,
                      ),
                    ),
                  ],
                  rows:
                      List<DataRow>.generate(state.addedusers.length, (index) {
                    return DataRow(cells: [
                      DataCell(Mytext(text: state.addedusers[index])),
                      DataCell(
                        Mytext(
                          text: state.resutllist[index] ? 'Present' : 'Absent',
                        ),
                      ),
                    ]);
                  }),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        MyExcel.exportToExcel(
                            state.addedusers, state.resutllist);
                      });
                    },
                    child: const Mytext(
                      text: "excel",
                    )),
              ],
            ),
          ),
        );
      } else {
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
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/teacher.png",
                    width: 200,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Mytext(
                    text: "you didn't scan any Qr yet",
                    bold: true,
                    title: true,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
