import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revision_master/feature/todo/bloc/bloc_todo_view.dart';
import 'package:revision_master/feature/todo/bloc/todo_bloc.dart';

class BlocTodoApp extends StatelessWidget {
  const BlocTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => TodoBloc(), child: BlocTodoView());
  }
}
