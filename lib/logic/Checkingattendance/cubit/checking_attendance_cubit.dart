import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:steam_regestration_system/modules/hive_module.dart';

part 'checking_attendance_state.dart';

class CheckingAttendanceCubit extends Cubit<CheckingAttendanceState> {
  CheckingAttendanceCubit() : super(CheckingAttendanceInitial());
  Myhive myhive = Myhive(boxname: 'sco');
  void thefinallist(List mystudent) async {
    List<bool> resultList = [];
    List<String> addedstudent = [];
    var list2 = await myhive.getthebox();
    print("List from myhive.getthebox(): $list2");
    print("List from mystudent: $mystudent");

    for (var added in mystudent) {
      addedstudent.add(added['name']);
    }
    print(addedstudent);

    for (var name in list2) {
      if (addedstudent.contains(name)) {
        resultList.add(true);
      } else {
        resultList.add(false);
      }
    }

    print("Result List: $resultList");
    emit(TheAttendeedList(resutllist: resultList, addedusers: list2));
  }
}
