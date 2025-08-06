import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@HiveType(typeId: 2)
enum TaskPriority {
  @HiveField(0)
  low,
  @HiveField(1)
  medium,
  @HiveField(2)
  high,
}

@HiveType(typeId: 3)
@JsonSerializable()
class Task {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final bool isCompleted;

  @HiveField(4)
  final TaskPriority priority;

  @HiveField(5)
  final DateTime? dueDate;

  @HiveField(6)
  final String projectId;

  @HiveField(7)
  final String userId;

  @HiveField(8)
  final DateTime createdAt;

  @HiveField(9)
  final DateTime updatedAt;

  @HiveField(10)
  final DateTime? completedAt;

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
    this.priority = TaskPriority.medium,
    this.dueDate,
    required this.projectId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    this.completedAt,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);

  Task copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
    TaskPriority? priority,
    DateTime? dueDate,
    String? projectId,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? completedAt,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      priority: priority ?? this.priority,
      dueDate: dueDate ?? this.dueDate,
      projectId: projectId ?? this.projectId,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  bool get isOverdue {
    if (dueDate == null || isCompleted) return false;
    return DateTime.now().isAfter(dueDate!);
  }

  @override
  String toString() {
    return 'Task(id: $id, title: $title, isCompleted: $isCompleted, priority: $priority)';
  }
} 