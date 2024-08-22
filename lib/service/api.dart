import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:library_system/models/book_model.dart';
import 'package:library_system/models/borrower_model.dart';
import 'package:library_system/models/user_model.dart';
import 'package:library_system/service/api_constants.dart';


class BookService {
 
  Future<List<BookModel>> fetchBooks() async {
    final response = await http.get(Uri.parse(BooksApi.getBooksApi));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);

      return data.map((json) => BookModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }

// Future<void> deleteBook()async {
//   final deleteapi = await http.post(Uri.parse(BooksApi.deleteBookApi));

// }
  Future<void> addBook(BookModel book) async {
    final response = await http.post(
      Uri.parse(BooksApi.addBookApi),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'name': book.name,
        'isbn': book.isbn,
        'author_name': book.authorName,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add book');
    }
  }
}
class BorrowerService {
  Future<List<BorrowerModel>> fetchBorrowers() async {
    final response = await http.get(Uri.parse(BorrowersApi.getBorrowersApi)); 

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => BorrowerModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load borrowers');
    }
  }

  Future<void> addBorrower(BorrowerModel borrower) async{
    final response = await http.post(
      Uri.parse(BorrowersApi.addBorrowerApi),
      headers: {
        'Content-Type' : 'application/json',
      },
      body: json.encode({
        'name': borrower.name,
        'email': borrower.email
      }),
    );

    if(response.statusCode !=200){
      throw Exception('Failed to add borrower');
    }
  }
}

