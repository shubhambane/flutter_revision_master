import '../entities/api_todo.dart';
import '../repo/api_todo_repo.dart';

class ApiFetchTodoUsecase {
  final ApiTodoRepo repo;

  ApiFetchTodoUsecase(this.repo);

  Future<List<ApiTodo>> call() {
    return repo.fetchApiTodos();
  }
}
