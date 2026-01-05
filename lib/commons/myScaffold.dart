import 'package:flutter/material.dart';

class Myscaffold extends StatelessWidget {
  final String appBarText;
  final Widget scaffoldBody;
  final VoidCallback? fabOnPressed;
  final String fabText;

  const Myscaffold({
    super.key,
    required this.appBarText,
    required this.scaffoldBody,
    this.fabOnPressed,
    required this.fabText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appBarText)),
      body: SafeArea(child: Center(child: scaffoldBody)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: fabOnPressed,
        label: Text(fabText),
      ),
    );
  }
}
