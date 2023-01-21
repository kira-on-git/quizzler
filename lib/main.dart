// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  //int finalScore = 0;
  void checkAnswer(bool userPickedAnswer) {
    bool? correctAnswer = quizBrain.getQuestionAnswer();
    if (userPickedAnswer == correctAnswer) {
      scoreKeeper.add(const Icon(
        Icons.check,
        color: Colors.green,
      ));
      print('user got it right');
      //finalScore += 10;
    } else {
      print('user got it wrong');
      scoreKeeper.add(const Icon(
        Icons.close,
        color: Colors.red,
      ));
      //finalScore -= 5;
    }
    setState(() {
      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Expanded(
        //   flex: 5,
        //   child: Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: Center(
        //       child: Text(
        //         //SCORE ***************************************************
        //         finalScore.toString(),
        //         textAlign: TextAlign.center,
        //         style: const TextStyle(
        //           fontSize: 25.0,
        //           color: Colors.white,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                //QUESTION ***************************************************
                quizBrain.getQuestionText().toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
              textColor: Colors.white,
              color: Colors.green,
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //ANSWER TRUE *******************************************
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
              color: Colors.red,
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //ANSWER FALSE ******************************
                checkAnswer(false);
              },
            ),
          ),
        ),
        // Expanded(
        //   child: Padding(
        //     padding: const EdgeInsets.all(15.0),
        //     child: MaterialButton(
        //       color: Colors.blue,
        //       child: const Text(
        //         'SCORE',
        //         style: TextStyle(
        //           fontSize: 20.0,
        //           color: Colors.white,
        //         ),
        //       ),
        //       onPressed: () {
        //         //SCORE ******************************
        //       },
        //     ),
        //   ),
        // ),
        /** */

        /** */
        Row(children: scoreKeeper)
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/

