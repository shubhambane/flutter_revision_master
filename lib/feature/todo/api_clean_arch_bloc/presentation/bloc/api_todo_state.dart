import 'package:revision_master/feature/todo/api_clean_arch_bloc/domain/entities/api_todo.dart';

class ApiTodoState {}

class LoadingApiTodoState extends ApiTodoState {}

class LoadedApiTodoState extends ApiTodoState {
  final List<ApiTodo> apiTodos;

  LoadedApiTodoState(this.apiTodos);
}

class ErrorLoadingApiTodoState extends ApiTodoState {
  final String errorMsg;

  ErrorLoadingApiTodoState(this.errorMsg);
}
