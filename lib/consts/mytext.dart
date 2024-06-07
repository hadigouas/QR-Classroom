// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mytext extends StatelessWidget {
  const Mytext({
    Key? key,
    required this.text,
    this.bold = false,
    this.title = false,
    this.color = Colors.black,
  }) : super(key: key);
  final String text;
  final bool bold;
  final bool title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
        fontSize: title ? 30 : 20,
        color: color,
        fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
      ),
    );
  }
}
