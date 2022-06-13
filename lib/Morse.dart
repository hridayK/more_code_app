import 'package:flutter/material.dart';
import 'Converter.dart';

class MorsePage extends StatefulWidget {
  const MorsePage({Key? key}) : super(key: key);

  @override
  State<MorsePage> createState() => _MorsePageState();
}

class _MorsePageState extends State<MorsePage> {
  String _input = "";
  String _output = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Morse:",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      RawMaterialButton(
                        onPressed: () {},
                        child: const Icon(
                          Icons.book,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    _input,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),

            /* OUTPUT SECTION */
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "English:",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        RawMaterialButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.copy_all,
                            size: 40,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          _output,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textScaleFactor: 1.5,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RawMaterialButton(
                  onPressed: _space,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(15.0),
                  fillColor: const Color(0xFFF5B005),
                  child: const Icon(
                    Icons.space_bar,
                    color: Colors.white,
                  ),
                ),
                RawMaterialButton(
                  onPressed: _backspace,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(15.0),
                  fillColor: const Color(0xFFF5B005),
                  child: const Icon(
                    Icons.backspace,
                    color: Colors.white,
                  ),
                ),
                RawMaterialButton(
                  onPressed: _dot,
                  onLongPress: _hiffin,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(15.0),
                  fillColor: const Color(0xFFF5B005),
                  child: const Icon(
                    Icons.touch_app,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }



  void _dot() {
    setState(() {
      _input += ".";
      updateText(_input);
    });
  }

  void _hiffin() {
    setState(() {
      _input += "-";
      updateText(_input);
    });
  }

  void _space() {
    setState(() {
      _input += " ";
      updateText(_input);
    });
  }

  void _backspace() {
    if (_input.isEmpty == false) {
      setState(() {
        _input = _input.substring(0, _input.length - 1);
        updateText(_input);
      });
    }
  }

  void updateText(String input){
    setState((){
      var obj = Converter(input, false);
      _output = obj.convert();
    });
  }
}
