import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revision_master/feature/todo/api_clean_arch_bloc/presentation/bloc/api_todo_event.dart';
import 'package:revision_master/feature/todo/api_clean_arch_bloc/presentation/bloc/api_todo_state.dart';

import '../../domain/usecase/api_fetch_todo_usecase.dart';

class ApiTodoBloc extends Bloc<ApiTodoEvent, ApiTodoState> {
  final ApiFetchTodoUsecase apiFetchTodoUsecase;

  ApiTodoBloc(this.apiFetchTodoUsecase) : super(LoadingApiTodoState()) {
    on<FetchApiTodos>((event, emit) async {
      try {
        final todos = await apiFetchTodoUsecase();
        emit(LoadedApiTodoState(todos));
      } catch (e) {
        emit(ErrorLoadingApiTodoState("Error $e"));
      }
    });
  }
}
