import 'package:flutter/material.dart';
import 'package:image_guess_app/qustion_controller.dart';

void main() => runApp(FlutterQuiz());

QusetionController _questionController = QusetionController();

class FlutterQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quiz",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Guess Image ?"),
          centerTitle: true,
        ),
        body: ImageQuiz(),
      ),
    );
  }
}

class ImageQuiz extends StatefulWidget {
  @override
  _ImageQuizState createState() => _ImageQuizState();
}

class _ImageQuizState extends State<ImageQuiz> {
  List<Icon> _scoreKeeper = [];
  void checkAnswer(String userAnswer) {
    setState(
      () {
        if (_questionController.getAnswer() == userAnswer) {
          _scoreKeeper.add(
            Icon(Icons.check, color: Colors.green, size: 30),
          );
          _questionController.increaseCorrect();
        } else {
          _scoreKeeper.add(
            Icon(Icons.close, color: Colors.red, size: 30),
          );
          _questionController.increaseIncorrect();
        }
        if (_questionController.qnFinished()) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (dCtx) {
                return AlertDialog(
                  title: Text("Game Over"),
                  content: Text(
                      "You have answered all the questions : Score: ${_questionController.getCorrect()}"),
                  actions: [
                    RaisedButton(
                      onPressed: () {
                        Navigator.pop(dCtx);
                        setState(() {
                          _questionController.resetCounter();
                        });
                      },
                      child: Text("Play Again"),
                    ),
                  ],
                );
              });
          _scoreKeeper.clear();
        } else {
          _questionController.nextQuestion();
        }
      },
    );
  }

  Widget images({@required Image image}) {
    return Container(
      height: 200,
      width: 200,
      child: image,
    );
  }

  Widget questionText({@required String text}) {
    return Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buttons({@required String text, Color color}) {
    return FlatButton(
      color: color,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 18, letterSpacing: 2, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        checkAnswer(text);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 40, top: 10, right: 0, bottom: 0),
            child: Text(
              "Score ${_questionController.getCorrect()} / ${_questionController.getNum()}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ),
        images(
          image: Image.asset(
            _questionController.getImage(),
          ),
        ),
        questionText(text: _questionController.getQuestions()),
        SizedBox(
          height: 20,
        ),
        buttons(text: _questionController.btnTxt1(), color: Colors.blue),
        buttons(text: _questionController.btnTxt2(), color: Colors.red),
        buttons(text: _questionController.btnTxt3(), color: Colors.green),
        buttons(text: _questionController.btnTxt4(), color: Colors.greenAccent),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _scoreKeeper,
          ),
        ),
      ],
    );
  }
}
