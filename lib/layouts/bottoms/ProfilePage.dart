import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/utils/myColors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20.0),
      children: [
        avatar(),
        SizedBox(height: 20),
        userName(),
        SizedBox(height: 40),
        changePassBtn(),
      ],
    );
  }

  Widget avatar() {
    return Align(
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey[300]),
          shape: BoxShape.circle,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(1000.0),
          child: SvgPicture.asset("assets/logo.svg"),
        ),
      ),
    );
  }

  Widget userName() {
    return Align(
      child: Text(
        "Quizzie",
        style: TextStyle(
          fontSize: 30,
          color: primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget changePassBtn() {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, "/changePass");
        },
        leading: Icon(Icons.lock, color: primaryColor),
        title: Text(
          "Change Password",
          style: TextStyle(
            color: primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
