import 'package:flutter/material.dart';
//quando le classi vengono usate vanno importate per rendere efficaci
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:quizaap/quiz_brain.dart';

//creo un oggetto della classe Quizbrain
Quizbrain quizbrain = Quizbrain();

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: CorpoApp(),
    );
  }
}

class CorpoApp extends StatefulWidget {
  @override
  _CorpoAppState createState() => _CorpoAppState();
}

class _CorpoAppState extends State<CorpoApp> {
  List<Widget> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    //creo una variabile booleana che prende il valore dalla
    //lista di valori booleani.
    bool correctanswer = quizbrain.getQuestionAnswer();
    setState(() {
      //confronto la variabile booleana con l'elemento
      //che si trova all'interno della lista
      if (userPickedAnswer == correctanswer) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      quizbrain.nextQuestion();
    });
  }

  //creo un contatore
  int questionnumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(child: Text('App Per quiz')),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  //modo questionBank è diventato una proprità
                  //dell nostro oggetto quizbrain
                  quizbrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  onPressed: () {
                    checkAnswer(true);
                  },
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text(
                    'TRUE',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  onPressed: () {
                    checkAnswer(false);
                  },
                  textColor: Colors.white,
                  color: Colors.red,
                  child: Text(
                    'FALSE',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ),
            Row(
              children: scoreKeeper,
            )
          ],
        ),
      ),
    );
  }
}
