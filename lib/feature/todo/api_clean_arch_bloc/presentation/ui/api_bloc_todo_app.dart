import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/api_fetch_todo_usecase.dart';
import '../bloc/api_todo_bloc.dart';
import 'api_bloc_todo_view.dart';

class ApiBlocTodoApp extends StatelessWidget {
  final ApiFetchTodoUsecase apiFetchTodoUsecase;

  const ApiBlocTodoApp({super.key, required this.apiFetchTodoUsecase});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ApiTodoBloc(apiFetchTodoUsecase),
      child: ApiBlocTodoView(),
    );
  }
}
