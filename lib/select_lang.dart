import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LangChange extends StatelessWidget {
  const LangChange(this.fromLang, this.toLang, this.lang, this.onLangChange,
      {super.key});
  final String fromLang;
  final String toLang;
  final Function onLangChange;
  final Map<String, String> lang;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color.fromARGB(255, 178, 130, 239),
          width: 3,
        ),
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: const Color.fromARGB(255, 178, 130, 239),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 5, right: 5),
        padding: const EdgeInsets.all(2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButton<String>(
              alignment: Alignment.center,
              value: fromLang,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Color.fromARGB(0, 255, 193, 7),
              ),
              iconSize: 20,
              elevation: 15,
              underline: Container(color: Colors.transparent),
              style: GoogleFonts.lato(
                fontSize: 15,
                color: Color.fromARGB(255, 31, 88, 232),
                fontWeight: FontWeight.bold,
              ),
              onChanged: (val) {
                onLangChange("fromLang", val);
              },
              items: lang
                  .map((string, value) {
                    return MapEntry(
                      string,
                      DropdownMenuItem<String>(
                        value: value,
                        child: Text(string),
                      ),
                    );
                  })
                  .values
                  .toList(),
            ),
            IconButton(
              onPressed: () {
                onLangChange("switch", "st");
              },
              icon: const Icon(
                Icons.compare_arrows_sharp,
                size: 40,
              ),
            ),
            DropdownButton<String>(
              alignment: Alignment.center,
              value: toLang,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Color.fromARGB(0, 255, 193, 7),
              ),
              iconSize: 20,
              elevation: 15,
              underline: Container(color: Colors.transparent),
              style: GoogleFonts.lato(
                fontSize: 15,
                color: Color.fromARGB(255, 31, 88, 232),
                fontWeight: FontWeight.bold,
              ),
              onChanged: (val) {
                onLangChange("toLang", val);
              },
              items: lang
                  .map((string, value) {
                    return MapEntry(
                      string,
                      DropdownMenuItem<String>(
                        value: value,
                        child: Text(string),
                      ),
                    );
                  })
                  .values
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
