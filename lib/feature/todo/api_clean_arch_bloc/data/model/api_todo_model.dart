import 'package:revision_master/feature/todo/api_clean_arch_bloc/domain/entities/api_todo.dart';

class ApiTodoModel extends ApiTodo {
  ApiTodoModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.completed,
  });

  factory ApiTodoModel.fromJson(Map<String, dynamic> json) {
    return ApiTodoModel(
      id: json["id"],
      userId: json["userId"],
      title: json["title"],
      completed: json["completed"],
    );
  }
}
