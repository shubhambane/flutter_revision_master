import 'package:flutter/material.dart';
import 'package:revision_master/async_await/async_await.dart';
import 'package:revision_master/commons/myScaffold.dart';

class FutureHome extends StatefulWidget {
  const FutureHome({super.key});

  @override
  State<FutureHome> createState() => _FutureHomeState();
}

class _FutureHomeState extends State<FutureHome> {
  late Future<String> value;
  int delay = 3;

  Future<String> loadData() {
    return Future.delayed(
      Duration(seconds: delay),
      () => "Data loader after $delay sec",
    );
  }

  @override
  void initState() {
    value = loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Myscaffold(
      appBarText: 'Future Demo',
      scaffoldBody: FutureBuilder(
        future: value,
        builder: (context, snapShot) {
          if (!snapShot.hasData) return CircularProgressIndicator.adaptive();
          return Text(snapShot.data ?? '');
        },
      ),
      fabOnPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => AsyncAwait()),
        );
      },
      fabText: 'Async/Await',
    );
  }
}
