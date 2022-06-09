class Converter {
  late String _input="";
  late bool _isEnglish;
  var codes = {
    'A': ".-",
    'B': "-...",
    'C': "-.-.",
    'D': "-..",
    'E': ".",
    'F': "..-.",
    'G': "--.",
    'H': "....",
    'I': "..",
    'J': ".---",
    'K': "-.-",
    'L': ".-..",
    'M': "--",
    'N': "-.",
    'O': "---",
    'P': ".--.",
    'Q': "--.-",
    'R': ".-.",
    'S': "...",
    'T': "-",
    'U': "..-",
    'V': "...-",
    'W': ".--",
    'X': "-..-",
    'Y': "-.--",
    'Z': "--.",
    " ": " "
  };

  var decipher = {};


  Converter(String input, bool isEnglish) {
    _input = input;
    _isEnglish = isEnglish;
  }

  String convert() {
    codes.forEach((key, value) {
      decipher.addEntries([MapEntry(value, key)]);
    });
    String op = ""; //op stands for output
    var words = [];

    if (_isEnglish) {
      for(int i=0;i<_input.length;i++){
        words.add(codes[_input[i]]);
      }
    }else{
      var alphabets = _input.split(" ");
      for(int i=0;i<alphabets.length;i++){
        words.add(decipher[alphabets[i]]);
      }
    }
    op = words.join(" ");
    return op;
  }
}
