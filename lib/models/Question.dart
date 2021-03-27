class Question {
  int id;
  int qid; // questionnaire id
  String name;
  String trueAns;
  String falseAns1;
  String falseAns2;
  String falseAns3;
  DateTime updatedAt;
  DateTime createdAt;

  Question({
    this.id,
    this.qid,
    this.name,
    this.trueAns,
    this.falseAns1,
    this.falseAns2,
    this.falseAns3,
    this.updatedAt,
    this.createdAt,
  });
}
