import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:revision_master/core/storage/todo_model.dart';
import 'hive_boxes.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TodoAdapter());
    await Hive.openBox<Todo>(HiveBoxes.todos);
  }

  static Box<Todo> get todoBox => Hive.box<Todo>(HiveBoxes.todos);
}
