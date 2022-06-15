import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            Scrollbar(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.32,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue)
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          const Text(
                            "Morse:",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          RawMaterialButton(onPressed: () async {
                            ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
                            setState((){
                              _input = data?.text ?? "";
                            });
                            updateText(_input);
                          },
                            child: const Icon(Icons.paste),
                          )
                        ],
                      ),
                      Text(
                        _input,
                        style: const TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),

            /* OUTPUT SECTION */
            SingleChildScrollView(
              child: Scrollbar(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xff2C2A4A),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SingleChildScrollView(
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
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Copied the Message"),
                                  ),
                                );
                                Clipboard.setData(ClipboardData(text: _output));
                              },
                              child: const Icon(
                                Icons.copy_all,
                                size: 30,
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
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
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
                  onLongPress: (){
                    setState((){
                      _input="";
                      updateText(_input);
                    });
                  },
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

  void updateText(String input) {
    setState(() {
      var obj = Converter(input, false);
      _output = obj.convert();
    });
  }
}
