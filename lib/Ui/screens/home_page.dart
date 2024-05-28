import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steam_regestration_system/Ui/screens/after_scanning.dart';
import 'package:steam_regestration_system/Ui/screens/base_screen.dart';
import 'package:steam_regestration_system/logic/adding_student.dart/cubit/add_student_cubit.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddStudentCubit, AddStudentState>(
      builder: (context, state) {
        if (state is Mystudents) {
          List mystudent = state.studentlist;
          return AfterScanning(state: state, mystudents: mystudent);
        } else {
          return const BaseScreen();
        }
      },
    );
  }
}
