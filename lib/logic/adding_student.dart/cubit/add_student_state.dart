// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_student_cubit.dart';

@immutable
sealed class AddStudentState {}

final class AddStudentInitial extends AddStudentState {}

class Mystudents extends AddStudentState {
  List studentlist;
  Mystudents({
    required this.studentlist,
  });
}
