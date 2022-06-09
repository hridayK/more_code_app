import 'package:flutter/material.dart';
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
    return Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              onChanged: (text) {
                setState(() {
                  var obj = Converter(text.toUpperCase(), true);
                  _input = text;
                  _output = obj.convert();
                });
              },
              style: TextStyle(fontSize: 30, color: Colors.deepPurple, fontWeight: FontWeight.bold),
            ),
            // Row(
            //   children: [
            //     RawMaterialButton(
            //       onPressed: () {},
            //       child: const Icon(Icons.translate, size: 25,),
            //     )
            //   ],
            // ),
            Text(_output,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold), textScaleFactor: 1.5,)
          ],
        ));
  }
}
