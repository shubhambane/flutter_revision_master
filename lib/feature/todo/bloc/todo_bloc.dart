import 'package:revision_master/core/storage/todo_model.dart';
import 'package:revision_master/feature/todo/bloc/todo_event.dart';
import 'package:revision_master/feature/todo/bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/storage/hive_service.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final _box = HiveService.todoBox;

  TodoBloc() : super(TodoInitial()) {
    on<LoadTodos>((event, emit) {
      emit(TodosLoaded(_box.values.toList()));
    });
    on<AddTodo>((event, emit) {
      _box.add(Todo(event.title));
      emit(TodosLoaded(_box.values.toList()));
    });
    on<DeleteTodo>((event, emit) {
      _box.deleteAt(event.index);
      emit(TodosLoaded(_box.values.toList()));
    });
  }
}
