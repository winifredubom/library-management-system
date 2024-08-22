import 'package:flutter/material.dart';
import 'package:library_system/utils/screen_size.dart';

class Cards extends StatelessWidget {
 final String title;
 final String author;

  final VoidCallback onTap;


  const Cards({
    super.key,
   required this.onTap,
    required this.title,
     required this.author
  });

  @override
  Widget build(BuildContext context) {
      final screenUtils = ScreenUtils(context);

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: screenUtils.screenWidth *0.85,
        height: screenUtils.screenHeight * 0.2,
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(title,
                overflow: TextOverflow.ellipsis,
                 style: const TextStyle(fontSize: 20)),
                Text(author,
                overflow: TextOverflow.ellipsis,
                 style:const  TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




// class BookLoggerPage extends ConsumerStatefulWidget {
//   const BookLoggerPage({super.key});

//   @override

//   _BookLoggerPageState createState() => _BookLoggerPageState();
// }

// class _BookLoggerPageState extends ConsumerState<BookLoggerPage> {
//   @override
//   void initState() {
//     super.initState();
//     _logBooks();
//   }

//   Future<void> _logBooks() async {
//     try {
     
//       final books = await ref.read(bookServiceProvider).fetchBooks();
      
//       for (var book in books) {
//         debugPrint('Book: ${book.name}, Author: ${book.authorName}');
//       }
//     } catch (e) {
//       debugPrint('Error fetching books: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Book Logger Page'),
//       ),
//       body: const Center(
//         child: Text('Check console for logged book data.'),
//       ),
//     );
//   }
// }
