import 'package:flutter/material.dart';
import 'package:steam_regestration_system/Ui/screens/widgets/checkbox_row.dart';
import 'package:steam_regestration_system/consts/mytext.dart';
import 'package:steam_regestration_system/logic/adding_student.dart/cubit/add_student_cubit.dart';

class MydataTable extends StatelessWidget {
  MydataTable({super.key, required this.mystudents, required this.state});
  AddStudentState state;
  List mystudents;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DataTable(
        dataRowMaxHeight: 55,
        horizontalMargin: 45,
        headingRowColor:
            MaterialStateColor.resolveWith((states) => Colors.blue[200]!),
        dataRowColor: MaterialStateColor.resolveWith((states) => Colors.white),
        border: TableBorder.all(borderRadius: BorderRadius.circular(10)),
        columns: const [
          DataColumn(
              label: Mytext(
            text: 'Student',
            bold: true,
          )),
          DataColumn(
              label: Mytext(
            text: 'attendance',
            bold: true,
          )),
        ],
        rows: mystudents
            .map(
              (student) => DataRow(cells: [
                DataCell(Mytext(text: student['name'])),
                DataCell(InkWell(
                  onTap: () {},
                  // child: Mytext(
                  //     text: student['present']
                  //         .toString())
                  child: const Mycheckbox(),
                )),
              ]),
            )
            .toList(),
      ),
    );
  }
}
