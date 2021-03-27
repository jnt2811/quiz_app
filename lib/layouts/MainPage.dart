import 'package:flutter/material.dart';
import 'package:quiz_app/layouts/bottoms/CollectionPage.dart';
import 'package:quiz_app/layouts/bottoms/HomePage.dart';
import 'package:quiz_app/layouts/bottoms/ProfilePage.dart';
import 'package:quiz_app/layouts/bottoms/SearchPage.dart';
import 'package:quiz_app/utils/myColors.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, @required this.initIndex}) : super(key: key);

  final int initIndex;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex;

  List<Widget> bodyOptions = [
    HomePage(),
    SearchPage(),
    CollectionPage(),
    ProfilePage(),
  ];

  List<BottomNavigationBarItem> bottomOptions = [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
    BottomNavigationBarItem(icon: Icon(Icons.book_outlined), label: "Collection"),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: "Profile"),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = this.widget.initIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomOptions,
        currentIndex: currentIndex,
        onTap: (val) {
          setState(() {
            currentIndex = val;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/newQuestionnaire');
        },
        child: Icon(Icons.add),
      ),
      body: bodyOptions.elementAt(currentIndex),
    );
  }

  AppBar appBar() {
    String title;

    switch (currentIndex) {
      case 0:
        title = "Home";
        break;
      case 1:
        title = "Search";
        break;
      case 2:
        title = "Collection";
        break;
      case 3:
        title = "Profile";
        break;
      default:
        title = "Quiz App";
    }

    return AppBar(
      title: Text(title),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 5.0),
          child: IconButton(
            icon: Icon(Icons.login_rounded, size: 30),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            },
          ),
        ),
      ],
    );
  }
}
