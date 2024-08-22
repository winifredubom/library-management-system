import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:library_system/models/borrower_model.dart';
import 'package:library_system/models/user_model.dart';
import 'package:library_system/service/api.dart';

final borrowerProvider = StateNotifierProvider<BorrowerNotifier, List<BorrowerModel>>((ref) {
  return BorrowerNotifier();
});

class BorrowerNotifier extends StateNotifier<List<BorrowerModel>> {
  BorrowerNotifier() : super([]);

  final BorrowerService _borrowerService = BorrowerService(); 


  Future<void> addBorrower(BorrowerModel borrowerModel) async {
    try {
   
      await _borrowerService.addBorrower(borrowerModel);

   
      state = [...state, borrowerModel];
    } catch (e) {
  
      print('Failed to add book: $e');
     
    }
  }
}
