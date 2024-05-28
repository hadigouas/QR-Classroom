import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:steam_regestration_system/Ui/screens/main_screen.dart';
import 'package:steam_regestration_system/consts/consts.dart';
import 'package:steam_regestration_system/consts/mytext.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.3,
            decoration: BoxDecoration(color: mygreen),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
                  child: Image.asset('assets/images/Untitled design (2).png'),
                ),
                const Mytext(
                  color: Color.fromARGB(255, 255, 255, 255),
                  title: true,
                  text: "welcom to ",
                  bold: true,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Mytext(
                  color: Color.fromARGB(255, 255, 255, 255),
                  title: true,
                  text: " QRClassroom",
                  bold: true,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "streamline attendance with Our QR Registration App",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(backgroundColor: mysecond),
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setBool("welcom", true);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainScreen(),
                              ));
                        },
                        child: const Mytext(
                          text: "Get started",
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
