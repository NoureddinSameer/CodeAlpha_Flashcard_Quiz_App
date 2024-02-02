import 'package:flashcard_app/addcard.dart';
import 'package:flashcard_app/quizscreen.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flashcard Quiz'),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/image.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => const AddCard()));
                  },
                  child: const Text('Add Flashcard'),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    _startQuiz();
                  },
                  child: const Text('Start Quiz'),
                ),
              ],
            ),
          ),
        ));
  }

  void _startQuiz() {
    if (flashcards.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizPage(flashcards),
        ),
      );
    } else {
      var snackBar = const SnackBar(content: Text('No Data'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
