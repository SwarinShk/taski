class TaskModel {
  final int id;
  final String title;
  final String description;
  final bool isCompleted;
  final String createdBy;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.createdBy,
  });

  TaskModel copyWith({
    int? id,
    String? title,
    String? description,
    bool? isCompleted,
    String? createdBy,
  }) => TaskModel(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    isCompleted: isCompleted ?? this.isCompleted,
    createdBy: createdBy ?? this.createdBy,
  );

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    isCompleted: json["isCompleted"],
    createdBy: json['createdBy'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "isCompleted": isCompleted,
    "createdBy": createdBy,
  };
}
