import 'package:flutter/material.dart';
import 'package:quiz_app/layouts/ingame/ResultPage.dart';
import 'package:quiz_app/layouts/questionnaire/SingleQuestionnaire.dart';
import 'package:quiz_app/models/Questionnaire.dart';
import 'package:quiz_app/utils/myColors.dart';
import 'package:quiz_app/utils/slideRightRoute.dart';

class AnswerQuestion extends StatefulWidget {
  AnswerQuestion({
    Key key,
    @required this.questionnaire,
  }) : super(key: key);

  final Questionnaire questionnaire;

  @override
  _AnswerQuestionState createState() => _AnswerQuestionState();
}

class _AnswerQuestionState extends State<AnswerQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: appBar(),
      body: body(),
    );
  }

  Widget appBar() {
    return AppBar(
      elevation: 0,
      leading: InkWell(
        child: Icon(
          Icons.arrow_back_ios_rounded,
          size: 35,
        ),
        onTap: () {
          showDialog(context: context, builder: (context) => exitDialog());
        },
      ),
      actions: [timer()],
    );
  }

  Widget exitDialog() {
    return AlertDialog(
      title: Text("Are you sure?"),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ignore: deprecated_member_use
          FlatButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                SlideRightRoute(
                  page: SingleQuestionnaire(
                    questionnaire: this.widget.questionnaire,
                  ),
                ),
                (route) => false,
              );
            },
            child: Text("YES"),
            textColor: Colors.white,
            color: Colors.green,
          ),
          // ignore: deprecated_member_use
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("NO"),
            textColor: Colors.white,
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget timer() {
    return Row(
      children: [
        Icon(Icons.timer, size: 35),
        SizedBox(width: 10),
        Text(
          "20s",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  }

  Widget body() {
    return Container(
      padding: EdgeInsets.all(20.0),
      height: MediaQuery.of(context).size.height - 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          question(),
          answers(),
        ],
      ),
    );
  }

  Widget question() {
    return Column(
      children: [
        Text(
          "1",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xfff2c94c),
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Đố em biết 1 cộng 1 bằng mấy?",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget answers() {
    return Column(
      children: [
        answerTile(color: Colors.greenAccent),
        SizedBox(height: 20),
        answerTile(color: Colors.amberAccent),
        SizedBox(height: 20),
        answerTile(color: Colors.blueAccent),
        SizedBox(height: 20),
        answerTile(color: Colors.white),
      ],
    );
  }

  Widget answerTile({
    String answer,
    Color color,
  }) {
    // ignore: deprecated_member_use
    return FlatButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => ResultPage(questionnaire: this.widget.questionnaire),
            ),
            (route) => false);
      },
      child: Text(
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae, molestiae!",
        style: TextStyle(fontSize: 18),
      ),
      color: color,
      padding: EdgeInsets.all(20.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
