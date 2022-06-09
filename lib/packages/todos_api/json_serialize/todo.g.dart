part of '../models/todo.dart';

Todo _$TodoFromJson(Map<String, dynamic> json) => Todo(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      isCompleted: json['isCompleted'] as bool,
    );

Map<String, dynamic> _$TodoToJson(Todo todo) => <String, dynamic>{
      'id': todo.id,
      'title': todo.title,
      'description': todo.description,
      'isCompleted': todo.isCompleted,
    };
