import 'package:image_guess_app/answer_twist.dart';
import 'package:image_guess_app/questions.dart';

class QusetionController {
  int _num = 0;
  int _correct = 0;
  int _incorrect = 0;
  List<Questions> _question = [
    Questions(
        imageName: "images/cat.jpg",
        questionText: "The Domestic Animal ?",
        answerText: "Cat"),
    Questions(
        imageName: "images/elephant.jpg",
        questionText: "Most Intelligent Animal In The World ?",
        answerText: "Elephant"),
    Questions(
        imageName: "images/pig.jpg",
        questionText: "Dirty Eating Animal ?",
        answerText: "Pig"),
    Questions(
        imageName: "images/tiger.jpg",
        questionText: "King Of Jungle ?",
        answerText: "Tiger"),
    Questions(
        imageName: "images/zebra.jpg",
        questionText: "Grass Eater ?",
        answerText: "Zebra")
  ];
  List<BtnTxt> _btnTxt = [
    BtnTxt(btn_1: "Cat", btn_2: "Dog", btn_3: "Parrot", btn_4: "Python"),
    BtnTxt(
        btn_1: "Anaconda",
        btn_2: "Cobra",
        btn_3: "Elephant",
        btn_4: "Cat Fish"),
    BtnTxt(btn_1: "Whale", btn_2: "Shark", btn_3: "Monkey", btn_4: "Pig"),
    BtnTxt(btn_1: "Liopard", btn_2: "Tiger", btn_3: "Fox", btn_4: "Alligator"),
    BtnTxt(btn_1: "Mouse", btn_2: "Lizard", btn_3: "Zebra", btn_4: "Ent"),
  ];

  void increaseCorrect() {
    _correct++;
  }

  void increaseIncorrect() {
    _incorrect++;
  }

  void nextQuestion() {
    _num++;
  }

  bool qnFinished() {
    if (_num < _question.length - 1) {
      return false;
    } else {
      return true;
    }
  }

  void resetCounter() {
    _num = 0;
    _correct = 0;
    _incorrect = 0;
  }

  String getImage() {
    return _question[_num].imageName;
  }

  String getQuestions() {
    return _question[_num].questionText;
  }

  String getAnswer() {
    return _question[_num].answerText;
  }

  String btnTxt1() {
    return _btnTxt[_num].btn_1;
  }

  String btnTxt2() {
    return _btnTxt[_num].btn_2;
  }

  String btnTxt3() {
    return _btnTxt[_num].btn_3;
  }

  String btnTxt4() {
    return _btnTxt[_num].btn_4;
  }

  String getNum() {
    return _num.toString();
  }

  String getCorrect() {
    return _correct.toString();
  }

  String getIncorrect() {
    return _incorrect.toString();
  }
}
