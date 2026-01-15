import '../entities/api_todo.dart';

abstract class ApiTodoRepo {
  Future<List<ApiTodo>> fetchApiTodos();
}
