import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revision_master/feature/todo/api_clean_arch_bloc/presentation/bloc/api_todo_bloc.dart';
import 'package:revision_master/feature/todo/api_clean_arch_bloc/presentation/bloc/api_todo_state.dart';
import 'package:revision_master/ui/commons/myScaffold.dart';

import '../bloc/api_todo_event.dart';

class ApiBlocTodoView extends StatefulWidget {
  const ApiBlocTodoView({super.key});

  @override
  State<ApiBlocTodoView> createState() => _ApiBlocTodoViewState();
}

class _ApiBlocTodoViewState extends State<ApiBlocTodoView> {
  @override
  void initState() {
    context.read<ApiTodoBloc>().add(FetchApiTodos());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Myscaffold(
      appBarText: "Api Bloc Todo",
      scaffoldBody: BlocBuilder<ApiTodoBloc, ApiTodoState>(
        builder: (context, state) {
          if (state is LoadingApiTodoState) {
            return CircularProgressIndicator();
          }
          if (state is LoadedApiTodoState) {
            return ListView.builder(
              itemCount: state.apiTodos.length,

              itemBuilder: (_, i) {
                final todo = state.apiTodos[i];
                return ListTile(
                  leading: Text(todo.id.toString()),
                  title: Text(todo.title),
                  trailing: Checkbox(
                    value: todo.completed,
                    onChanged: (bool? value) {},
                  ),
                );
              },
            );
          }
          if (state is ErrorLoadingApiTodoState) {
            return Text(state.errorMsg);
          }
          return SizedBox();
        },
      ),
    );
  }
}
