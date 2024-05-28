import 'dart:io';

import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class MyExcel {
  static Future<void> exportToExcel(List users, List attendence) async {
    print("is working");
    // Create a new Excel document
    final Workbook workbook = Workbook();

    // Access the first sheet
    final Worksheet sheet = workbook.worksheets[0];

    // Add headers
    sheet.getRangeByName('A1').setText('User');
    sheet.getRangeByName('B1').setText('Attendance');

    // Add data to the cells
    for (int i = 0; i < attendence.length; i++) {
      print(
          'Writing data for row ${i + 2}: ${users[i]} - ${attendence[i] ? 'Present' : 'Absent'}');
      // Rows in Excel start from 1
      sheet.getRangeByName('A${i + 2}').setText(users[i].toString());
      sheet
          .getRangeByName('B${i + 2}')
          .setText(attendence[i] ? 'Present' : 'Absent');
    }
    // Save the workbook
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    // Get the directory where the file will be saved
    final Directory? directory = await getExternalStorageDirectory();
    final String path = '${directory!.path}/example.xlsx';

    // Write the bytes to the file
    final File file = File(path);
    await file.writeAsBytes(bytes);

    // Open the file using the open_file package
    OpenFile.open(path);
  }
}
