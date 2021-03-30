import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> items = ["1", "2", "3"];

    List<Widget> arr = [];

    items.forEach((element) {
      arr.add(Text(element));
    });

    return ListView(
      children: [
        SizedBox(
          height: 50,
        ),
        Column(
          children: arr,
        )
      ],
    );
  }
}
