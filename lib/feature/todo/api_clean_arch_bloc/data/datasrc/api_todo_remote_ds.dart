import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:revision_master/feature/todo/api_clean_arch_bloc/data/model/api_todo_model.dart';

class ApiTodoRemoteDs {
  Future<List<ApiTodoModel>> fetchApiTodos() async {
    final res = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/todos?_limit=10"),
    );
    final data = jsonDecode(res.body) as List;
    return data.map((e) => ApiTodoModel.fromJson(e)).toList();
  }
}
