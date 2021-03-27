import 'package:flutter/material.dart';
import 'package:quiz_app/layouts/MainPage.dart';
import 'package:quiz_app/layouts/auths/SignupPage.dart';
import 'package:quiz_app/layouts/auths/loginPage.dart';
import 'package:quiz_app/layouts/question/NewQuestion.dart';
import 'package:quiz_app/layouts/questionnaire/NewQuestionnaire.dart';
import 'package:quiz_app/utils/myColors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizzie',
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: primaryColor,
        ),
        primarySwatch: primarySwatchColor,
        primaryColor: primaryColor,
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            headline6: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      initialRoute: '/main',
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/main': (context) => MainPage(initIndex: 0),
        '/newQuestionnaire': (context) => NewQuestionnaire(),
      },
    );
  }
}
