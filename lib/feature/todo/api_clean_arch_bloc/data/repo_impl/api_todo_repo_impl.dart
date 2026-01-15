import '../../domain/entities/api_todo.dart';
import '../../domain/repo/api_todo_repo.dart';
import '../datasrc/api_todo_remote_ds.dart';

class ApiTodoRepoImpl implements ApiTodoRepo {
  final ApiTodoRemoteDs remoteDs;

  ApiTodoRepoImpl({required this.remoteDs});

  @override
  Future<List<ApiTodo>> fetchApiTodos() {
    return remoteDs.fetchApiTodos();
  }
}
