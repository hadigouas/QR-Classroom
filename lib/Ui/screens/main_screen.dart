import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:steam_regestration_system/Ui/screens/allstudents.dart';
import 'package:steam_regestration_system/Ui/screens/home_page.dart';
import 'package:steam_regestration_system/Ui/screens/presence_Screen.dart';
import 'package:steam_regestration_system/Ui/screens/users_adding.dart';
import 'package:steam_regestration_system/consts/consts.dart';
import 'package:steam_regestration_system/consts/mytext.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

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
                    ));
              },
            ),
          ),
        );
      },
    );
  }
}
