import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:steam_regestration_system/Ui/screens/allstudents.dart';
import 'package:steam_regestration_system/Ui/screens/home_page.dart';
import 'package:steam_regestration_system/Ui/screens/presence_Screen.dart';
import 'package:steam_regestration_system/Ui/screens/users_adding.dart';
import 'package:steam_regestration_system/consts/consts.dart';
import 'package:steam_regestration_system/consts/mytext.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List card = [
    {"image": "assets/images/class.png", "title": "all students"},
    {"image": "assets/images/student.png", "title": "add students"},
    {"image": "assets/images/qr-code.png", "title": "scan with QR"},
    {"image": "assets/images/immigration.png", "title": "check attendance"},
  ];

  GlobalKey _one = GlobalKey();
  GlobalKey _two = GlobalKey();
  GlobalKey _three = GlobalKey();
  GlobalKey _four = GlobalKey();

  @override
  void initState() {
    super.initState();
    // Delay the showcase start to ensure the widget tree is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ShowCaseWidget.of(context).startShowCase([_one, _two, _three, _four]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: (context) {
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
            padding: const EdgeInsets.only(top: 120.0, left: 8, right: 8),
            child: GridView.builder(
              itemCount: card.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                GlobalKey key;
                String title;
                String description;

                switch (index) {
                  case 0:
                    key = _one;
                    title = 'All Students';
                    description = 'View all registered students';
                    break;
                  case 1:
                    key = _two;
                    title = 'Add Students';
                    description = 'Add new students to the system';
                    break;
                  case 2:
                    key = _three;
                    title = 'Scan with QR';
                    description = 'Scan student attendance using QR code';
                    break;
                  case 3:
                    key = _four;
                    title = 'Check Attendance';
                    description = 'Check the attendance records';
                    break;
                  default:
                    key = GlobalKey();
                    title = '';
                    description = '';
                }

                return GestureDetector(
                  onTap: () {
                    switch (index) {
                      case 0:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AllStudents(),
                            ));
                        break;
                      case 1:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UsersAdding(),
                            ));
                        break;
                      case 2:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Myhomepage(),
                            ));
                        break;
                      case 3:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PresenceScreen(),
                            ));
                        break;
                      default:
                    }
                  },
                  child: Showcase(
                    key: key,
                    title: title,
                    description: description,
                    child: Card(
                      margin: const EdgeInsets.all(5),
                      elevation: 8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            card[index]["image"],
                            width: 80,
                          ),
                          Mytext(
                            text: card[index]["title"],
                            bold: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
