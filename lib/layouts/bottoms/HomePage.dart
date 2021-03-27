import 'package:flutter/material.dart';

// import 'package:quiz_app/utils/default.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.8,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                card(color: Colors.white),
                card(color: Colors.white),
                card(color: Colors.white),
                card(color: Colors.white),
                card(color: Colors.white),
                card(color: Colors.white),
                card(color: Colors.white),
              ],
            ),
          ),
          Container(
            child: Text(
              "Recent Quiz",
              style: TextStyle(fontFamily: 'IBM Plex Sans'),
            ),
          ),
        ],
      ),
    );
  }

  Widget card({Color color}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
      child: Container(
        width: 100,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Text here',
            style: TextStyle(color: Colors.red, fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.35),
              spreadRadius: 3,
              blurRadius: 3,
              // offset: Offset(0, 2),
            )
          ],
          color: color,
        ),
      ),
    );
  }
}

// MyPage2widget() {}

class MyPage1widget {}
