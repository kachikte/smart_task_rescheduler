import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Project {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String color;

  @HiveField(4)
  final String userId;

  @HiveField(5)
  final DateTime createdAt;

  @HiveField(6)
  final DateTime updatedAt;

  @HiveField(7)
  final bool isArchived;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.color,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    this.isArchived = false,
  });

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectToJson(this);

  Project copyWith({
    String? id,
    String? name,
    String? description,
    String? color,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isArchived,
  }) {
    return Project(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      color: color ?? this.color,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isArchived: isArchived ?? this.isArchived,
    );
  }

  @override
  String toString() {
    return 'Project(id: $id, name: $name, userId: $userId)';
  }
} 