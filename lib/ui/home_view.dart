import 'package:flutter/material.dart';

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
          _tile(context, 'Provider Todo', const ProviderTodoApp()),
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
