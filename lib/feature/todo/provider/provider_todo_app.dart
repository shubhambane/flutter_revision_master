import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider_todo.dart';
import 'provider_todo_view.dart';

class ProviderTodoApp extends StatelessWidget {
  const ProviderTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProviderTodo(),
      child: ProviderTodoView(),
    );
  }
}
