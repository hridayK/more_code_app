import 'package:flutter/material.dart';
import 'English.dart';
import 'Morse.dart';
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

  static const _style = TextStyle(fontSize: 114,fontWeight: FontWeight.bold);

  static const List<Widget> _widgets = <Widget>[
    EnglishPage(),
    MorsePage(),
  ];

  int _widgetIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgets[_widgetIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.translate),
            label: "English",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.password),
            label: "Morse",
          )
        ],
        currentIndex: _widgetIndex,
        onTap: (index){
          setState((){
            _widgetIndex = index;
          });
        },
      ),
    );
  }
}
