import 'package:flutter/material.dart';
import 'package:steam_regestration_system/modules/hive_module.dart';

import '../../consts/consts.dart';
import '../../consts/mytext.dart';

class AllStudents extends StatefulWidget {
  const AllStudents({Key? key}) : super(key: key);

  @override
  State<AllStudents> createState() => _AllStudentsState();
}

class _AllStudentsState extends State<AllStudents> {
  Myhive myhive = Myhive(boxname: "sco");
  List allstudents = []; // Initialize as an empty list

  @override
  void initState() {
    super.initState();
    // Load the data from Hive when the widget initializes
    loadStudents();
  }

  // Function to fetch all students from Hive
  Future<void> loadStudents() async {
    List students = await myhive.getthebox();
    setState(() {
      allstudents = students;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mysecond,
        title: const Mytext(
          text: 'all Students',
          bold: true,
        ),
        centerTitle: true,
      ),
      backgroundColor: mygreen,
      body: allstudents.isEmpty
          ? Padding(
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
                      text: "you didn't add any users yet",
                      bold: true,
                      title: true,
                      color: Colors.white,
                    ),
                  ],
                ),
              ))
          : ListView.builder(
              itemCount: allstudents.length,
              itemBuilder: (context, index) {
                // Display each student as a ListTile
                return Column(
                  children: [
                    const Divider(),
                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 20,
                      child: Center(child: Mytext(text: allstudents[index])),

                      // You can add more fields as needed
                    ),
                  ],
                );
              },
            ),
    );
  }
}
