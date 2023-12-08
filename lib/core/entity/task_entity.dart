class TaskEntity {
  final String id;
  final String title;
  final String description;

  TaskEntity(
      {required this.id, required this.title, required this.description});

  factory TaskEntity.fromJson(Map<String, dynamic> json) {
    return TaskEntity(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['title'] = title;
    data['description'] = description;

    return data;
  }
}
