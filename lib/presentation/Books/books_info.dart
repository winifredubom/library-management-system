import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:library_system/models/book_model.dart';

class BooksInfo extends StatelessWidget {
  final BookModel book;

  const BooksInfo({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Book Information',
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${book.name}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Author: ${book.authorName}', style:  TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            const Text('Description: Description', style:  TextStyle(fontSize: 14)),
            const SizedBox(height: 10),
            const Text('Genre: Mysterious', style:  TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
