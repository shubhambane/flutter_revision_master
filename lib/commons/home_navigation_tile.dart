import 'package:flutter/material.dart';

class HomeNavigationTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const HomeNavigationTile({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
      contentPadding: EdgeInsets.all(20),
      trailing: Icon(Icons.north_east),
    );
  }
}
