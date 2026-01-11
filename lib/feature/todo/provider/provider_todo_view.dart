import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revision_master/feature/todo/provider/provider_todo.dart';
import 'package:revision_master/ui/commons/myScaffold.dart';

class ProviderTodoView extends StatefulWidget {
  const ProviderTodoView({super.key});

  @override
  State<ProviderTodoView> createState() => _ProviderTodoViewState();
}

class _ProviderTodoViewState extends State<ProviderTodoView> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.watch<ProviderTodo>();
    return Myscaffold(
      appBarText: "Provider Todo",
      scaffoldBody: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Task"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoProvider.todos.length,
              itemBuilder: (_, i) => ListTile(
                title: Text(todoProvider.todos[i].title),
                onTap: () {},
                trailing: IconButton(
                  onPressed: () {
                    context.read<ProviderTodo>().deleteTask(i);
                  },
                  icon: Icon(Icons.delete),
                ),
              ),
            ),
          ),
        ],
      ),
      fabText: "Add",
      fabOnPressed: () {
        context.read<ProviderTodo>().createTask(controller.text.trim());
        controller.clear();
      },
    );
  }
}
