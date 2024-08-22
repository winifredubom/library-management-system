import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:library_system/models/book_model.dart';
import 'package:library_system/service/api.dart';


final bookInventoryProvider = StateNotifierProvider<BookInventoryNotifier, List<BookModel>>((ref) {
  return BookInventoryNotifier();
});

class BookInventoryNotifier extends StateNotifier<List<BookModel>> {
  BookInventoryNotifier() : super([]);

  final BookService _bookService = BookService(); 


  Future<void> addBook(BookModel bookModel) async {
    try {
   
      await _bookService.addBook(bookModel);

   
      state = [...state, bookModel];
    } catch (e) {
  
      print('Failed to add book: $e');
     
    }
  }
}
