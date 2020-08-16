class Question {
  String questionText;
  List<String> options;
  List<int> answer;
  bool isMultipleAnswer;

  Question(
      {this.questionText, this.options, this.answer, this.isMultipleAnswer});

  Question.fromJson(Map<String, dynamic> json) {
    questionText = json['questionText'];
    options = json['options'].cast<String>();
    answer = json['answer'].cast<int>();
    isMultipleAnswer = json['isMultipleAnswer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionText'] = this.questionText;
    data['options'] = this.options;
    data['answer'] = this.answer;
    data['isMultipleAnswer'] = this.isMultipleAnswer;
    return data;
  }
}