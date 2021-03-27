class Questionnaire {
  int id;
  int uid;
  String name;
  String topic;
  bool public;
  String desc;
  int timeLimit;
  DateTime updatedAt;
  DateTime createdAt;

  Questionnaire({
    this.id,
    this.uid,
    this.name,
    this.topic,
    this.public,
    this.desc,
    this.timeLimit,
    this.updatedAt,
    this.createdAt,
  });
}
