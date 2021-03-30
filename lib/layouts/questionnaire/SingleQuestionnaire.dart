import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:quiz_app/layouts/MainPage.dart';
import 'package:quiz_app/layouts/questionnaire/EditQuestionnaire.dart';
import 'package:quiz_app/models/Questionnaire.dart';
import 'package:quiz_app/utils/bottomType.dart';
import 'package:quiz_app/utils/myColors.dart';
import 'package:quiz_app/utils/slideRightRoute.dart';

class SingleQuestionnaire extends StatefulWidget {
  SingleQuestionnaire({
    Key key,
    @required this.questionnaire,
  }) : super(key: key);

  final Questionnaire questionnaire;

  @override
  _SingleQuestionnaireState createState() => _SingleQuestionnaireState();
}

class _SingleQuestionnaireState extends State<SingleQuestionnaire> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Questionnaire"),
        leading: Container(
          margin: EdgeInsets.only(left: 5.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded, size: 25),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                SlideRightRoute(
                  page: MainPage(initBody: BottomType.collection),
                ),
                (route) => false,
              );
            },
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 5.0),
            child: IconButton(
              icon: Icon(Icons.settings, size: 30),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditQuestionnaire(questionaire: this.widget.questionnaire)),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: startButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: body(),
    );
  }

  Widget body() {
    return ListView(
      padding: EdgeInsets.all(20.0),
      children: [
        Text(
          "Name: " + "Toan roi rac",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "29/3/2021" + "  " + "by " + "Unknown",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 20),
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          itemCount: 5,
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          tapOnlyMode: false,
          onRatingUpdate: (value) {},
          itemSize: 20.0,
        ),
        SizedBox(height: 20),
        Text(
          "Topic: " + "Math",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Total: " + "3" + " questions",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Time Limit: " + "15" + " mins",
          style: TextStyle(
            color: primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Description: " + "Lorem ipsum sit amet...",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget startButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => NewQuestion(questionaire: this.widget.questionaire),
          //   ),
          // );
        },
        child: Text(
          "Start",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
