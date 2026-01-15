import 'package:flutter/material.dart';

import '../feature/todo/api_clean_arch_bloc/api_bloc_todo_factory.dart';
import '../feature/todo/api_clean_arch_bloc/presentation/ui/api_bloc_todo_app.dart';
import '../feature/todo/bloc/bloc_todo_app.dart';
import '../feature/todo/provider/provider_todo_app.dart';
import 'commons/myScaffold.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Myscaffold(
      appBarText: 'Flutter PlayGround',
      scaffoldBody: Column(
        children: [
          _tile(context, 'Provider Todo', const ProviderTodoApp()),
          _tile(context, 'BloC Todo', const BlocTodoApp()),
          _tile(context, "Api BloC Todo", ApiBlocTodoFactory.create()),
        ],
      ),
    );
  }

  Widget _tile(BuildContext c, String title, Widget page) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(c, MaterialPageRoute(builder: (_) => page));
      },
    );
  }
}
