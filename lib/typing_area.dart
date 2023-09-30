import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypingArea extends StatelessWidget {
  const TypingArea(this.trans, this.textEditingController, {super.key});
  final Function trans;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        style: GoogleFonts.lato(fontSize: 21),
        controller: textEditingController,
        onChanged: (val) {
          trans();
        },
        decoration: InputDecoration(
          labelText: 'Type Here',
          labelStyle: GoogleFonts.lato(fontSize: 15),
          border: const OutlineInputBorder(),
        ),
        maxLines: 5,
        minLines: 5,
      ),
    );
  }
}
