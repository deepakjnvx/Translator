import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_translator/output_area.dart';
import 'package:language_translator/select_lang.dart';
import 'package:language_translator/typing_area.dart';
import 'package:translator/translator.dart';

class TranslationScreen extends StatefulWidget {
  const TranslationScreen({super.key});

  @override
  TranslationScreenState createState() => TranslationScreenState();
}

class TranslationScreenState extends State<TranslationScreen> {
  TextEditingController textEditingController = TextEditingController();
  GoogleTranslator translator = GoogleTranslator();
  var output;
  String fromLang = "en";
  String toLang = "hi";

  static const Map<String, String> lang = {
    "Hindi": "hi",
    "English": "en",
    "Urdu": "ur",
    "Amharic": "am",
    "Arabic": "ar",
    "Basque": "eu",
    "Bengali": "bn",
    "Portuguese (Brazil)": "pt-BR",
    "French": "fr",
    "German": "de",
    "Greek": "el",
    "Gujarati": "gu",
    "Italian": "it",
    "Japanese": "ja",
    "Kannada": "kn",
    "Korean": "ko",
    "Malayalam": "ml",
    "Marathi": "mr",
    "Russian": "ru",
    "Chinese (PRC)": "zh-CN",
    "Spanish": "es",
    "Tamil": "ta",
    "Telugu": "te",
    "Chinese (Taiwan)": "zh-TW",
  };

  void trans() {
    translator
        .translate(textEditingController.text, to: toLang)
        .then((value) {
      setState(() {
        output = value;
      });
    });
  }

  void onLangChange(String langch, String newValue) {
    setState(() {
      if (langch == "toLang") {
        toLang = newValue;
      }
      if (langch == "switch") {
        var temp = toLang;
        toLang = fromLang;
        fromLang = temp;
      }
      if (langch == "fromLang") {
        fromLang = newValue;
      }
      trans();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        LangChange(fromLang, toLang, lang, onLangChange),
        const SizedBox(
          height: 20,
        ),
        TypingArea(trans, textEditingController),
        const SizedBox(
          height: 20,
        ),
        Text('Translated Text', style: GoogleFonts.lato(fontSize: 20)),
        const SizedBox(
          height: 20,
        ),
        OutputArea(output),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
