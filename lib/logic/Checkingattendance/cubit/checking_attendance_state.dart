// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'checking_attendance_cubit.dart';

@immutable
sealed class CheckingAttendanceState {}

final class CheckingAttendanceInitial extends CheckingAttendanceState {}

class TheAttendeedList extends CheckingAttendanceState {
  List<bool> resutllist;
  List addedusers;

  TheAttendeedList({
    required this.resutllist,
    required this.addedusers,
  });
}
