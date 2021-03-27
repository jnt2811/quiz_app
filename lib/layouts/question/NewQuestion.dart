import 'package:flutter/material.dart';
import 'package:quiz_app/models/Questionnaire.dart';
import 'package:quiz_app/utils/myColors.dart';

class NewQuestion extends StatefulWidget {
  NewQuestion({
    Key key,
    @required this.questionaire,
  }) : super(key: key);

  final Questionnaire questionaire;

  @override
  _NewQuestionState createState() => _NewQuestionState();
}

class _NewQuestionState extends State<NewQuestion> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final trueAnswerController = TextEditingController();
  final falseAnswer1Controller = TextEditingController();
  final falseAnswer2Controller = TextEditingController();
  final falseAnswer3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Question"),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            nameInput(),
            SizedBox(height: 20.0),
            trueAnswerInput(),
            SizedBox(height: 20.0),
            falseAnswer1Input(),
            SizedBox(height: 20.0),
            falseAnswer2Input(),
            SizedBox(height: 20.0),
            falseAnswer3Input(),
            SizedBox(height: 40.0),
            createButton(),
          ],
        ),
      ),
    );
  }

  Widget nameInput() {
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(labelText: "Name"),
      keyboardType: TextInputType.text,
      validator: (value) {
        return value.isEmpty ? 'Name cannot be blank' : null;
      },
    );
  }

  Widget trueAnswerInput() {
    return TextFormField(
      controller: trueAnswerController,
      decoration: InputDecoration(labelText: "True Answer"),
      keyboardType: TextInputType.text,
      validator: (value) {
        return value.isEmpty ? 'True Answer cannot be blank' : null;
      },
    );
  }

  Widget falseAnswer1Input() {
    return TextFormField(
      controller: falseAnswer1Controller,
      decoration: InputDecoration(labelText: "False Answer 1"),
      keyboardType: TextInputType.text,
      validator: (value) {
        return value.isEmpty ? 'False Answer 1 cannot be blank' : null;
      },
    );
  }

  Widget falseAnswer2Input() {
    return TextFormField(
      controller: falseAnswer2Controller,
      decoration: InputDecoration(labelText: "False Answer 2"),
      keyboardType: TextInputType.text,
      validator: (value) {
        return value.isEmpty ? 'False Answer 2 cannot be blank' : null;
      },
    );
  }

  Widget falseAnswer3Input() {
    return TextFormField(
      controller: falseAnswer3Controller,
      decoration: InputDecoration(labelText: "False Answer 3"),
      keyboardType: TextInputType.text,
      validator: (value) {
        return value.isEmpty ? 'False Answer 3 cannot be blank' : null;
      },
    );
  }

  Widget createButton() {
    // ignore: deprecated_member_use
    return FlatButton(
      onPressed: () {
        final FormState form = formKey.currentState;
        if (form.validate()) {
          Navigator.pop(context);
        }
      },
      child: Text(
        "Create",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      color: primaryColor,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.symmetric(vertical: 15.0),
    );
  }
}
