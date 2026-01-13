import '../../../core/storage/todo_model.dart';

abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodosLoaded extends TodoState {
  final List<Todo> todos;

  TodosLoaded(this.todos);
}
