import 'package:flutter/material.dart';

class Student {
  String name;
  int age;

  Student({required this.name, required this.age});
}

class StudentTablePage extends StatefulWidget {
  const StudentTablePage({super.key});

  @override
  _StudentTablePageState createState() => _StudentTablePageState();
}

class _StudentTablePageState extends State<StudentTablePage> {
  List<StudentTable> studentTables = [];

  void addStudentTable() {
    setState(() {
      studentTables.add(const StudentTable());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Table'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: studentTables.length,
              itemBuilder: (context, index) {
                return studentTables[index];
              },
            ),
          ),
          ElevatedButton(
            onPressed: addStudentTable,
            child: const Text('Add Student Table'),
          ),
        ],
      ),
    );
  }
}

class StudentTable extends StatefulWidget {
  const StudentTable({super.key});

  @override
  _StudentTableState createState() => _StudentTableState();
}

class _StudentTableState extends State<StudentTable> {
  List<Student> students = [
    Student(name: 'John', age: 20),
    Student(name: 'Alice', age: 21),
    Student(name: 'Bob', age: 22),
  ];

  void addStudent() {
    setState(() {
      students.add(Student(name: 'New Student', age: 18));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DataTable(
          border: TableBorder.all(),
          columns: const [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Age')),
          ],
          rows: students
              .map(
                (student) => DataRow(
                  cells: [
                    DataCell(Text(student.name)),
                    DataCell(Text(student.age.toString())),
                  ],
                ),
              )
              .toList(),
        ),
        ElevatedButton(
          onPressed: addStudent,
          child: const Text('Add Student'),
        ),
        const SizedBox(height: 20), // Adjust the spacing as needed
      ],
    );
  }
}
