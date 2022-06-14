import 'package:flutter/material.dart';
import 'English.dart';
import 'Morse.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final _title = "Morse Code App";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // static const _style = TextStyle(fontSize: 114, fontWeight: FontWeight.bold);

  static const List<Widget> _widgets = <Widget>[
    EnglishPage(),
    MorsePage(),
  ];

  static const _topTextStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
  int _widgetIndex = 0;
  String _inputLang = "English";
  String _outputLang = "Morse";

  double _paddingAdjust = 7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Morse Code Converter",
          style: GoogleFonts.getFont(
            'Montserrat',
            textStyle: const TextStyle(color: Colors.black, fontSize: 26),
          ),
        ),
        elevation: 0,
        backgroundColor: const Color(0x00ffffff),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.fromLTRB(
            0, MediaQuery.of(context).size.height * 0.01, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_inputLang, style: _topTextStyle),
                SizedBox(width: _paddingAdjust),
                RawMaterialButton(
                  onPressed: _switchMode,
                  fillColor: const Color(0xff2faeff),
                  splashColor: Colors.blue,
                  child: const Icon(
                    Icons.compare_arrows,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 7),
                Text(_outputLang, style: _topTextStyle),
              ],
            ),
            _widgets[_widgetIndex],
          ],
        ),
      ),
    );
  }

  void _switchMode() {
    setState(() {
      if (_widgetIndex == 0) {
        _inputLang = "Morse";
        _outputLang = "English";
        _paddingAdjust = 9;
        _widgetIndex = 1;
      } else {
        _inputLang = "English";
        _outputLang = "Morse";
        _paddingAdjust = 7;
        _widgetIndex = 0;
      }
    });
  }
}
