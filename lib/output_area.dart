import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutputArea extends StatelessWidget {
  const OutputArea(this.output, {super.key});
  final output;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          margin:const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            output == null ? "Enter your Text" : output.toString(),
            style: GoogleFonts.lato(
                fontSize: 20,
                wordSpacing: 2,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
