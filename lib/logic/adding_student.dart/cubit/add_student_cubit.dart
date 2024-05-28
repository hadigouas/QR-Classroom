import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:steam_regestration_system/Ui/screens/widgets/mydata_table.dart';
import 'package:steam_regestration_system/modules/student_module.dart';

part 'add_student_state.dart';

class AddStudentCubit extends Cubit<AddStudentState> {
  AddStudentCubit() : super(AddStudentInitial());
  List<MydataTable> classes = [];
  List<Map> studentlist = [];
  void addsutdent(Student student) {
    Map substudent = {'name': student.fullname, 'present': student.present};
    //add a student
    studentlist.add(substudent);

    print(studentlist);
    emit(Mystudents(studentlist: studentlist));
  }
}
