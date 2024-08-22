import 'package:flutter/material.dart';

class HomeListTile extends StatelessWidget {
  final Icon leading;
  final Text title; 
  final Icon trailing;


  const HomeListTile({super.key,
  required this.leading,
  required this.title,
  required this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: title,
      trailing: trailing,
    );
  }
}