import 'package:flutter/material.dart';
import 'package:quiz_app/models/Question.dart';

class SingleQuestion extends StatefulWidget {
  SingleQuestion({Key key, this.question}) : super(key: key);

  final Question question;

  @override
  _SingleQuestionState createState() => _SingleQuestionState();
}

class _SingleQuestionState extends State<SingleQuestion> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
