import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Converter.dart';

class EnglishPage extends StatefulWidget {
  const EnglishPage({Key? key}) : super(key: key);

  @override
  State<EnglishPage> createState() => _EnglishPageState();
}

class _EnglishPageState extends State<EnglishPage> {
  String _input = "";
  String _output = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Scrollbar(
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    var obj = Converter(text.toUpperCase(), true);
                    _input = text;
                    _output = obj.convert();
                  });
                },
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
                maxLines: 5,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 6),
                  ),
                  hintText: "Enter your message",
                ),
                keyboardType: TextInputType.text,
                enableSuggestions: true,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),

            /* OUTPUT SECTION */
            Scrollbar(
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
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
                              "Morse Code:",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
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
                                size: 40,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),

                        Text(
                          _output,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textScaleFactor: 1.5,
                        ),
                      ],
                    ),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
