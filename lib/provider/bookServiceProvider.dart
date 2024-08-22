import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:library_system/models/book_model.dart';
import 'package:library_system/service/api.dart';

final bookServiceProvider = Provider((ref) => BookService());

final booksProvider = FutureProvider<List<BookModel>>((ref) async {
  final bookService = ref.read(bookServiceProvider);
  print('$bookService');
  return bookService.fetchBooks();
});
