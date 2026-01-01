import 'package:flutter/material.dart';
import 'package:revision_master/commons/myScaffold.dart';

class AsyncAwait extends StatefulWidget {
  const AsyncAwait({super.key});

  @override
  State<AsyncAwait> createState() => _AsyncAwaitState();
}

class _AsyncAwaitState extends State<AsyncAwait> {
  int delay = 3;
  String message = "Tap to load data";
  Future<String> getData() async {
    return await Future.delayed(
      Duration(seconds: delay),
      () => "Loaded after $delay seconds..",
    );
  }

  Future<void> loadData() async {
    setState(() {
      message = "Loading";
    });
    final result = await getData();
    setState(() {
      message = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Myscaffold(
      appBarText: "Async Await",
      scaffoldBody: Column(
        children: [
          Text(message),
          ElevatedButton(onPressed: loadData, child: Text("Load Data")),
        ],
      ),
      fabText: "",
    );
  }
}
