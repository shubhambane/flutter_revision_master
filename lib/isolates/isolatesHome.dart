import 'dart:developer';
import 'dart:isolate';

import 'package:flutter/material.dart';

import '../commons/myScaffold.dart';

class Isolateshome extends StatefulWidget {
  const Isolateshome({super.key});

  @override
  State<Isolateshome> createState() => _IsolateshomeState();
}

class _IsolateshomeState extends State<Isolateshome> {
  @override
  Widget build(BuildContext context) {
    return Myscaffold(
      appBarText: "Isolates",
      scaffoldBody: Column(children: [Image.asset("assets/meme.gif")]),
      fabText: "Test Isolates",
      fabOnPressed: () async {
        final receivePort = ReceivePort();
        await Isolate.spawn(getNums, receivePort.sendPort);
        receivePort.listen((num) {
          log("Total: $num");
        });
      },
    );
  }
}

getNums(SendPort sendPort) {
  int num = 0;
  for (int i = 0; i < 1000000000; i++) {
    num += i;
  }
  return sendPort.send(num);
}
