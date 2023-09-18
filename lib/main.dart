import 'package:angelaquizzler/quiz_brain.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scorekeeper = [];
  //   const Icon(
  //     Icons.check,
  //     color: Colors.green,
  //   ),
  //   const Icon(
  //     Icons.check,
  //     color: Colors.green,
  //   ),
  //   const Icon(
  //     Icons.check,
  //     color: Colors.green,
  //   ),
  //   const Icon(
  //     Icons.check,
  //     color: Colors.red,
  //   ),
  //   const Icon(
  //     Icons.check,
  //     color: Colors.red,
  //   ),
  // ];
  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.',
  // ];
  // List<bool> answers = [
  //   false,
  //   true,
  //   true,
  //   false,
  //   true,
  //   true,
  //   false,
  //   true,
  //   true,
  //   false,
  //   true,
  //   true,
  // ];
  Quizbrain quizbrain = Quizbrain();
  int questionNumber = 0;

  void checkanswer(bool checkanswer) {
    bool correctAnswers = quizbrain.getcorrectanswer();
    setState(() {
      if (quizbrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        quizbrain.reset();
        scorekeeper = [];
      } else {
        if (checkanswer == true) {
          print('Correct Answer');
          scorekeeper.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          print('InCorrect Answer');
          scorekeeper.add(
            const Icon(Icons.close, color: Colors.red),
          );
        }

        quizbrain.questioncount();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizbrain.getquestext(),
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
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkanswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              color: Colors.red,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  checkanswer(false);
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              color: Colors.red,
              child: TextButton(
                child: const Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  checkanswer(false);
                },
              ),
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        )
      ],
    );
  }
}
