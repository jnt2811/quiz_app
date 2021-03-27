import 'package:flutter/material.dart';
import 'package:quiz_app/layouts/questionnaire/EditQuestionnaire.dart';
import 'package:quiz_app/models/Questionnaire.dart';
import 'package:quiz_app/utils/myColors.dart';

class NewQuestionnaire extends StatefulWidget {
  NewQuestionnaire({Key key}) : super(key: key);

  @override
  _NewQuestionnaireState createState() => _NewQuestionnaireState();
}

class _NewQuestionnaireState extends State<NewQuestionnaire> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final topicController = TextEditingController();
  final timeLimitController = TextEditingController();
  final descController = TextEditingController();
  bool private;

  @override
  void initState() {
    super.initState();
    private = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Questionaire"),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.all(20.0),
            children: [
              nameInput(),
              SizedBox(height: 20.0),
              topicInput(),
              SizedBox(height: 20.0),
              timeLimitInput(),
              SizedBox(height: 20.0),
              descInput(),
              SizedBox(height: 20.0),
              privateCheckbox(),
              SizedBox(height: 20.0),
              createButton(),
            ],
          ),
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

  Widget topicInput() {
    return TextFormField(
      controller: topicController,
      decoration: InputDecoration(labelText: "Topic"),
      keyboardType: TextInputType.text,
      validator: (value) {
        return value.isEmpty ? 'Topic cannot be blank' : null;
      },
    );
  }

  Widget timeLimitInput() {
    return TextFormField(
      controller: timeLimitController,
      decoration: InputDecoration(labelText: "Time Limit (mins)"),
      keyboardType: TextInputType.number,
      validator: (value) {
        return value.isEmpty ? 'Time limit cannot be blank' : null;
      },
    );
  }

  Widget descInput() {
    return TextFormField(
      controller: descController,
      decoration: InputDecoration(labelText: "Description"),
      keyboardType: TextInputType.multiline,
      maxLines: 3,
    );
  }

  Widget privateCheckbox() {
    return CheckboxListTile(
      value: private,
      onChanged: (val) {
        setState(() {
          private = val;
        });
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      title: Text(
        "Private",
        style: TextStyle(color: Colors.black54),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.all(0),
    );
  }

  Widget createButton() {
    // ignore: deprecated_member_use
    return FlatButton(
      onPressed: () {
        final FormState form = formKey.currentState;
        if (form.validate()) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => EditQuestionnaire(
                questionaire: Questionnaire(
                  name: nameController.text,
                  topic: topicController.text,
                  timeLimit: int.parse(timeLimitController.text),
                ),
              ),
            ),
            (route) => false,
          );
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
