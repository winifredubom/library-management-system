import 'package:flutter/material.dart';
import 'package:library_system/models/borrower_model.dart';

class UserDetails extends StatelessWidget {
  final BorrowerModel borrower;

  const UserDetails({super.key, required this.borrower});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${borrower.name} Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text('Name: ${borrower.name}'),
            Text('Email: ${borrower.email}'),
            
          ],
        ),
      ),
    );
  }
}
