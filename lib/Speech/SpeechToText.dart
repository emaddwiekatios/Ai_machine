import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_to_text.dart' as stts;
class SpeechToText extends StatefulWidget {
  const SpeechToText({Key? key}) : super(key: key);

  @override
  State<SpeechToText> createState() => _SpeechToTextState();
}

class _SpeechToTextState extends State<SpeechToText> {
  var speechToText =stts.SpeechToText();
  String text='Press Button to Speach to text1';
   bool isListening=false;
  double _confidence=1.0;
@override
  void initState() {
  speechToText =stts.SpeechToText();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(

        appBar: AppBar( systemOverlayStyle: SystemUiOverlayStyle.light,
          title: Text('Confidence: ${(_confidence * 100.0).toStringAsFixed(1)}%'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
          animate: true ,//isListening,

          glowColor: Theme.of(context).primaryColor,
          endRadius: 75.0,
          duration: const Duration(milliseconds: 2000),
          repeatPauseDuration: const Duration(milliseconds: 100),
          repeat: true,
          child: FloatingActionButton(onPressed:_listen ,
            child: Icon(isListening? Icons.mic:Icons.mic_none),
          ),
        ),

      body:Center(child: Text(text))
    );
  }



  void _listen() async {
    if (!isListening) {
      bool available = await speechToText.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => isListening = true);
        speechToText.listen(
          onResult: (val) => setState(() {
            text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => isListening = false);
      speechToText.stop();
    }
  }

  // void listin() async{
  //   if(!isListing )
  //     {
  //       print('inside if');
  //       bool available =await  speechToText.initialize(
  //         onStatus: (status)=> print('$status'),
  //         onError: (errorNotification) =>print(errorNotification),
  //       );
  //
  //       if(available)
  //         {
  //           print('inside if available');
  //           setState(() {
  //             isListing=true;
  //           });
  //         }
  //       speechToText.listen(
  //         onResult: (result)=> setState(() {
  //
  //           text= result.recognizedWords;
  //           print(text);
  //         }),
  //       );
  //     }
  //  else {
  //     print('inside else available');
  //    setState(() {
  //      isListing =false;
  //    });
  //   }
  // }
}
