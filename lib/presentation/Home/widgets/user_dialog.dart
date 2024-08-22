
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:library_system/models/borrower_model.dart';
import 'package:library_system/models/user_model.dart';
import 'package:library_system/provider/borrowerProvider.dart';

class UserDialog extends ConsumerStatefulWidget {
  const UserDialog({super.key});

  @override
  _UserDialogState createState() => _UserDialogState();
}

class _UserDialogState extends ConsumerState<UserDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add a new User'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: 'User name',
              ),
            ),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child:const  Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            
            String name = _nameController.text;
            String email = _emailController.text;
          
          final newUser = BorrowerModel(
            name: name, 
            email: email) ;

            ref.read(borrowerProvider.notifier).addBorrower(newUser);

            Navigator.of(context).pop(); 
            Navigator.pushNamed(context, '/user_profile');
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}