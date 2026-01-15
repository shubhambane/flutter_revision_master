import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revision_master/feature/todo/bloc/todo_bloc.dart';
import 'package:revision_master/feature/todo/bloc/todo_event.dart';
import 'package:revision_master/feature/todo/bloc/todo_state.dart';
import 'package:revision_master/ui/commons/myScaffold.dart';

class BlocTodoView extends StatefulWidget {
  const BlocTodoView({super.key});

  @override
  State<BlocTodoView> createState() => _BlocTodoViewState();
}

class _BlocTodoViewState extends State<BlocTodoView> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    context.read<TodoBloc>().add(LoadTodos());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Myscaffold(
      appBarText: "Bloc Todo",
      scaffoldBody: Column(
        children: [
          TextField(controller: controller),
          BlocConsumer<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state is TodosLoaded) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (_, i) {
                      final todo = state.todos[i];
                      return ListTile(
                        title: Text(todo.title),
                        trailing: IconButton(
                          onPressed: () {
                            context.read<TodoBloc>().add(DeleteTodo(i));
                          },
                          icon: Icon(Icons.delete),
                        ),
                      );
                    },
                  ),
                );
              }
              return SizedBox();
            },
            listener: (context, state) {},
          ),
        ],
      ),
      fabText: "Add",
      fabOnPressed: () {
        context.read<TodoBloc>().add(AddTodo(controller.text.trim()));
        controller.clear();
      },
    );
  }
}
