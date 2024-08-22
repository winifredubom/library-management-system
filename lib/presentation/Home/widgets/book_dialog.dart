import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:library_system/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:library_system/provider/bookInventoryprovider.dart';

class MyFormDialog extends ConsumerStatefulWidget {
  const MyFormDialog({super.key});

  @override
  _MyFormDialogState createState() => _MyFormDialogState();
}

class _MyFormDialogState extends ConsumerState<MyFormDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _isbnController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _authorController.dispose();
    _isbnController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add a new Book'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: 'Book name',
                labelStyle: TextStyle(fontSize: 15),
              ),
            ),
            TextField(
              controller: _authorController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: 'Author',
                labelStyle: TextStyle(fontSize: 15),
              ),
            ),
            TextField(
              controller: _isbnController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'ISBN',
                labelStyle: TextStyle(fontSize: 15),
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
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            String name = _nameController.text;
            String author = _authorController.text;
            int? isbn = int.tryParse(_isbnController.text); 

            if (isbn != null) {
              final newBook = BookModel(
                name: name,
                authorName: author,
                isbn: isbn,
              );

              ref.read(bookInventoryProvider.notifier).addBook(newBook);

              Navigator.of(context).pop(); 
              Navigator.pushNamed(context, '/book_inventory');
             //  ref.refresh(booksProvider);
            } else {
           
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please enter a valid ISBN.')),
              );
            }
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
