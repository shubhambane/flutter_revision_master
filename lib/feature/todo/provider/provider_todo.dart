import 'package:flutter/foundation.dart';
import 'package:revision_master/core/storage/todo_model.dart';

import '../../../core/storage/hive_service.dart';
import '../shared/todo_model.dart';

class ProviderTodo extends ChangeNotifier {
  final _box = HiveService.todoBox;

  List<Todo> get todos => _box.values.toList();

  void createTask(String title) {
    _box.add(Todo(title));
    notifyListeners();
  }

  void deleteTask(int index) {
    _box.deleteAt(index);
    notifyListeners();
  }
}
