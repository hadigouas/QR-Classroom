// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Myhive {
  String boxname;
  Myhive({
    required this.boxname,
  });
//set the list of student
  void setinthebox(List myList) async {
    final hivebox = await Hive.openBox(boxname);
    await hivebox.addAll(myList);
    print(hivebox.values.toList());
  }

//getting the list
  Future<List> getthebox() async {
    final hivebox = await Hive.openBox(boxname);
    return hivebox.values.toList();
  }

//remove a user form a list
  void removeFromBoxAndRefresh(List myList, dynamic elementToRemove) async {
    final hiveBox = await Hive.openBox(boxname);
    myList.remove(elementToRemove);
    await hiveBox.clear();
    await hiveBox.addAll(myList);
    print(hiveBox.values.toList());
  }

//clear the box
  void clearbox() async {
    final hivebox = await Hive.openBox(boxname);
    hivebox.clear();
    print(hivebox.values.toList());
  }
}

@HiveType(typeId: 0)
class MyModel extends HiveObject {
  @HiveField(0)
  String name;

  MyModel(this.name);
}
