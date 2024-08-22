// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class  UserModel {
//   final int? id;
//   final String name;
//   final String email;
//   final bool? isDeleted;
//   final List<Null>? currentlyWithBooks;
  
//   UserModel({
//     required this.name,
//     required this.email,
//     this.currentlyWithBooks,
//     this.id,
//     this.isDeleted
//   });
// }

// // ignore: camel_case_types
// class UserProfile_Notifier extends StateNotifier<List<UserModel>>{
//   UserProfile_Notifier() : super([]);

//   void addUser(UserModel userModel){
//     state.add(userModel);

//     state = List.from(state);
//   }
// }