import 'package:flashcard_app/flashcard.dart';
import 'package:flutter/material.dart';

Set<Flashcard> flashcards = {};

Set<Flashcard> getFlashcard() {
  return flashcards;
}

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  String question = '', answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Flashcard'),
        centerTitle: true,
      ),
      body: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/image3.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Wrap(
                children: [
                  TextField(
                    onChanged: (value) {
                      question = value.toString();
                    },
                    decoration: const InputDecoration(
                      labelText: "Question",
                      labelStyle: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  TextField(
                    onChanged: (value) {
                      answer = value.toString();
                    },
                    decoration: const InputDecoration(
                      labelText: "Answer",
                      labelStyle: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (question == '' && answer == '') {
                          var snackBar = const SnackBar(
                              content: Text(
                                  'Please enter your question and your answer'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (question == '') {
                          var snackBar = const SnackBar(
                              content: Text('Please enter your question'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (answer == '') {
                          var snackBar = const SnackBar(
                              content: Text('Please enter your answer'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (answer == 'true' || answer == 'false') {
                          try {
                            setState(() {
                              flashcards.add(Flashcard(question, answer));
                              Navigator.of(context).pop();
                            });
                          } catch (e) {
                            var snackBar = const SnackBar(
                                content: Text('Please Enter a valid data!'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        } else {
                          var snackBar = const SnackBar(
                              content:
                                  Text('Your answer must be true or false'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: const Text('Add', textAlign: TextAlign.center),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
