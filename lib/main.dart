// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:steam_regestration_system/Ui/screens/main_screen.dart';
import 'package:steam_regestration_system/Ui/screens/welcom_screen.dart';
import 'package:steam_regestration_system/logic/Checkingattendance/cubit/checking_attendance_cubit.dart';
import 'package:steam_regestration_system/logic/adding_student.dart/cubit/add_student_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool welcom = prefs.getBool("welcom") ?? false;
  await Hive.initFlutter();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AddStudentCubit(),
      ),
      BlocProvider(
        create: (context) => CheckingAttendanceCubit(),
        child: Container(),
      )
    ],
    child: MyApp(
      prefs: welcom,
    ),
  ));
}

class MyApp extends StatelessWidget {
  bool prefs;
  MyApp({
    Key? key,
    this.prefs = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check if preferences are initialized before accessing them

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        // Assuming you are using Material 3
        useMaterial3: true,
      ),
      home: prefs == true ? MainScreen() : const WelcomScreen(),
    );
  }
}
