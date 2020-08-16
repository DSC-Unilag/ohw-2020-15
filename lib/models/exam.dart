import 'question.dart';

class Examination {
  int examId;
  String title;
  String description;
  String instructions;
  int institutionId;
  String classGroup;
  String openDate;
  String closeDate;
  String status;
  List<Question> questions;

  Examination(
      {this.examId,
      this.title,
      this.description,
      this.instructions,
      this.institutionId,
      this.classGroup,
      this.openDate,
      this.closeDate,
      this.status,
      this.questions});

  Examination.fromJson(Map<String, dynamic> json) {
    examId = json['examId'];
    title = json['title'];
    description = json['description'];
    instructions = json['instructions'];
    institutionId = json['institutionId'];
    classGroup = json['classGroup'];
    openDate = json['openDate'];
    closeDate = json['closeDate'];
    status = json['status'];
    if (json['question'] != null) {
      questions = new List<Question>();
      json['question'].forEach((v) {
        questions.add(new Question.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['examId'] = this.examId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['instructions'] = this.instructions;
    data['institutionId'] = this.institutionId;
    data['classGroup'] = this.classGroup;
    data['openDate'] = this.openDate;
    data['closeDate'] = this.closeDate;
    data['status'] = this.status;
    if (this.questions != null) {
      data['questions'] = this.questions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
