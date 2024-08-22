import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:library_system/presentation/Books/books_info.dart';
import 'package:library_system/presentation/Books/widgets/book_card.dart';
import 'package:library_system/provider/bookServiceProvider.dart';
import 'package:library_system/utils/screen_size.dart';

class BookInventory extends ConsumerStatefulWidget {
  const BookInventory({super.key});

  @override
  _BookInventoryState createState() => _BookInventoryState();
}

class _BookInventoryState extends ConsumerState<BookInventory> {

@override
  void initState() {
    super.initState();
   // remove widget binding
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.refresh(booksProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    final booksAsyncValue = ref.watch(booksProvider);
    final screenUtils = ScreenUtils(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Books Inventory',
          style: TextStyle(fontSize: 20),
        ),
        actions: const [
          SizedBox(
            width: 200,
            height: 350,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: SearchBar(
                hintText: 'Search for books...',
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
        child: booksAsyncValue.when(
          data: (books) => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, 
              childAspectRatio: 1.2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0, 
            ),
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return SizedBox(
                height: screenUtils.screenHeight * 0.9,
                width: screenUtils.screenWidth * 1.0,
                child: Cards(
                  title: book.name,
                  author: book.authorName,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  BooksInfo(book: book),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ),
      ),
    );
  }
}
