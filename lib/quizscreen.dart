import 'package:flutter/material.dart';
import 'flashcard.dart';

class QuizPage extends StatefulWidget {
  final Set<Flashcard> flashcards;

  const QuizPage(this.flashcards);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentCardIndex = 0;
  int userScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Quiz'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/image2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50.0),
                  SizedBox(
                    height: 250,
                    width: 250,
                    child: Card(
                      elevation: 4,
                      child: Center(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Center(
                              child: Text(
                                widget.flashcards
                                    .elementAt(currentCardIndex)
                                    .question,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  ElevatedButton.icon(
                    onPressed: () {
                      _checkAnswer(true);
                    },
                    icon: const Icon(
                      Icons.check,
                      semanticLabel: 'true',
                    ),
                    label: const Text('True'),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton.icon(
                    onPressed: () {
                      _checkAnswer(false);
                    },
                    icon: const Icon(
                      Icons.cancel_rounded,
                      semanticLabel: 'false',
                    ),
                    label: const Text('False'),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    'Score: $userScore',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ]),
        ));
  }

  void _checkAnswer(bool userAnswer) {
    if (userAnswer ==
        (widget.flashcards.elementAt(currentCardIndex).answer == 'true')) {
      setState(() {
        userScore++;
      });
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      if (currentCardIndex < widget.flashcards.length - 1) {
        currentCardIndex++;
      } else {
        // End of the quiz, display the final score
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Quiz Complete'),
              content: Text(
                  'Your Score: $userScore out of ${widget.flashcards.length}'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });
  }
}
