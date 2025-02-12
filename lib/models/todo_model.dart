class TodoModel {
  String text;
  bool done;

  TodoModel({
    required this.text,
    this.done = false,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      text: json['text'],
      done: json['done'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'done': done,
    };
  }
}
