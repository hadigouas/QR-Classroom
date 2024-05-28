import 'package:flutter/material.dart';
import 'package:steam_regestration_system/Ui/screens/home_page.dart';
import 'package:steam_regestration_system/modules/hive_module.dart';

import '../../consts/consts.dart';
import '../../consts/mytext.dart';

class UsersAdding extends StatefulWidget {
  const UsersAdding({Key? key}) : super(key: key);

  @override
  State<UsersAdding> createState() => _UsersAddingState();
}

class _UsersAddingState extends State<UsersAdding> {
  ////////////////////////////////////////
  Myhive myhive = Myhive(boxname: 'sco');
////////////////////////////////////////////
  late List<String> studentNames;
  late TextEditingController mycontroller;
  List<TextEditingController> controllers = [];
  int myindex = -1;

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      mycontroller = TextEditingController();
      controllers.add(mycontroller);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mysecond,
        title: const Mytext(
          text: 'School attendance system',
          bold: true,
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Myhomepage(),
                    ));
              },
              child: const Mytext(
                text: 'Skip',
                color: Colors.white,
                bold: true,
              ))
        ],
      ),
      backgroundColor: mygreen,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controllers.length,
                itemBuilder: (context, index) {
                  myindex = index;
                  // print(myindex);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controllers[index],
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              controllers.removeAt(index);
                            });
                            for (var e in controllers) {
                              print(e.text);
                            }
                          },
                          icon: const Icon(Icons.delete),
                          color: Colors.red[300],
                        ),
                        filled: true,
                        fillColor: Colors.blue[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            width: 5,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      backgroundColor: mysecond,
                    ),
                    onPressed: () {
                      setState(() {
                        TextEditingController newController =
                            TextEditingController();
                        controllers.add(newController);
                      });
                    },
                    child: const Mytext(
                      text: 'add student',
                      color: Colors.white,
                      bold: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          backgroundColor: mysecond,
                        ),
                        onPressed: () {
                          if (myindex >= 0) {
                            studentNames = controllers
                                .map((controller) => controller.text.trim())
                                .toList();
                            studentNames.removeWhere((name) => name.isEmpty);

                            print(studentNames);
                            myhive.setinthebox(studentNames);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Myhomepage(),
                                ));
                          }
                        },
                        child: const Mytext(
                          text: 'submit',
                          bold: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          backgroundColor: mysecond,
                        ),
                        onPressed: () {
                          setState(() {
                            myhive.clearbox();
                            controllers.clear();
                          });
                        },
                        child: const Mytext(
                          text: 'clear',
                          bold: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
