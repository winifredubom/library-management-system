import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:library_system/presentation/Books/books_info.dart';
import 'package:library_system/presentation/Users/user_profileDetails.dart';
import 'package:library_system/presentation/Users/widget/user_card.dart';
import 'package:library_system/provider/borrowerServiceProvider.dart';

class UserProfile extends ConsumerStatefulWidget {
  const UserProfile({super.key});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends ConsumerState<UserProfile>{

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback( (_){
      ref.refresh(borrowersProvider);
    
    }
    );
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
final usersAsyncValue = ref.watch(borrowersProvider);


    return Scaffold(
      appBar: AppBar(
        title:  const Text('User Profiles',
        style: TextStyle(fontSize: 20),),
        actions:const  [
          SizedBox(
            width: 200,
            height: 350,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: SearchBar(
                hintText: 'Search for users...',
              ),
            ),
          )
        ],
      ),
       body:  Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
        child: usersAsyncValue.when(
          data: (borrowers) =>  GridView.builder(
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              childAspectRatio: 1.2, // Width-to-height ratio of cards
              mainAxisSpacing: 10.0, // Space between rows
              crossAxisSpacing: 10.0, // Space between columns
            ),
          
            itemCount: borrowers.length,
            itemBuilder: (context, index) {
              final borrower = borrowers[index];
              return   UserCard(
                email: borrower.email,
                name: borrower.name,
                onTap: (){
                  Navigator.push(context,
                   MaterialPageRoute(builder: (context) => 
                   UserDetails(borrower: borrower),));
                },
              );
            }
          ),
          loading: () => const Center(child: CircularProgressIndicator(),),
          error: (error, stack) => Center(child: Text('Error: $error'),)
        ),
          ),
    );
  }
}
