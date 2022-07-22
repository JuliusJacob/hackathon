import 'package:flutter/material.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatefulWidget {


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final questions = [
    {
      'questionText': 'who is your favorite girlfriend?',
      'answer' : [
       { 'text': 'nanah'},
        {'text': 'angel'},
        {'text': 'jackline'}
      ]
    },
    {
   'questionText' : 'What is your favorite team',
   'answer' : [
   {'text': 'simba'},
   {'text': 'Bayern munich'}, 
  {'text': 'Paris St germain'}

   ]
    }
  ];

  int questionIndex = 0;

  void answerQuestion () {

    setState((){

      questionIndex = questionIndex + 1;
    });

    print(questionIndex);
  }

  void resetQuiz()
  {
   setState((){
    questionIndex = 0; 
   });
  }

@override
Widget build(BuildContext context){

  return MaterialApp(
title: 'this is my first application',

home: Scaffold(appBar: 
AppBar(
  title: Text('welcome to my application'),
),
body: questionIndex<questions.length ? Column(

  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
        Center(
          child: Container (
            
            child: Text(questions[questionIndex]['questionText'] as String),
        ),
        ),

    ...(questions[questionIndex]['answer'] as List<Map<String, dynamic>>).map((value){
return Container(child: TextButton(onPressed: () {answerQuestion();}, child: Text(value['text'])),);

    }).toList(),


  ],
)

: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
        Center(child:  Text('You have finished all your questions'),),
        RaisedButton(onPressed: (){resetQuiz();}, child: Text('press to restart'),)
  ],
),

),

  );
}
}