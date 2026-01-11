import 'package:hive_ce/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 1)
class Todo {
  @HiveField(0)
  final String title;

  Todo(this.title);
}
