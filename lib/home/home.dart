import 'package:flutter/material.dart';
import 'package:flutter_speech_text_app/home/components/app_bar_search_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController textEditingController = TextEditingController();
  stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Aperte no microfone para iniciar';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarSearchText(
              controller: textEditingController,
              iconMic: _isListening,
              onPressedMic: _listen,
            ),
            Container(
              child: Text(
                _text,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _listen() async {
    if (!_isListening) {
      await _speech.initialize(
          onError: (result) => print('onError: $result'),
          onStatus: (result) {
            if (result == 'notListening') {
              setState(() {
                _isListening = false;
                _text = textEditingController.text;
              });
            }
          });

      if (_speech.isAvailable) {
        setState(
          () => _isListening = true,
        );
        _speech.listen(
          onResult: (val) => setState(() {
            textEditingController.text = val.recognizedWords;
          }),
        );
      }
    } else {
      _speech.stop();
    }
  }
}
