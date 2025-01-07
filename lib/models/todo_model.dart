class TodoModel {
  final int? id;
  final String title;
  final String subtitle;
  final bool isDone;

  TodoModel({
    this.id,
    required this.title,
    required this.subtitle,
    this.isDone = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'isDone': isDone ? 1 : 0,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      title: map['title'],
      subtitle: map['subtitle'],
      isDone: map['isDone'] == 1,
    );
  }
}
