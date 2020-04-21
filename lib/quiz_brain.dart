//importo la classe dove sono definii i le question
import 'package:flutter/rendering.dart';
import 'package:quizaap/question.dart';

class Quizbrain{


  int _questionNumber=0;

  //Ccreo una lista di oggetti della classe Question
  //per evitare che questa classe venga modificata aggiungiamo _ al nome della classe
  //cosi da renderla immodificabile
  List<Question>_questionBank=[
    Question( '4<1', false),
    Question('5>1', true ),
    Question(  '9<0', false)
  ];

  //questa funzione gestisce l'avanzamento nella lista di oggetti
  void nextQuestion(){
    if(_questionNumber<_questionBank.length-1){
      _questionNumber++;
    }
    print(_questionNumber);
    print(_questionBank.length);
  }

  //creo un metodo all'interno della classe che mi consente di
  //accedere alla lista di oggetti privata delle domande
  String getQuestionText(){
    return _questionBank[_questionNumber].questionText;
  }

  //in questo modo posso decidere solo all'interno di questa classe cosa fare con
  //la lista delle domande
  bool getQuestionAnswer( ){

    return _questionBank[_questionNumber].questionAnswer;
  }

}