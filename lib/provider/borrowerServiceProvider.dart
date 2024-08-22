import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:library_system/models/borrower_model.dart';
import 'package:library_system/service/api.dart';

final borrowerServiceprovider = Provider((ref) => BorrowerService());

final borrowersProvider = FutureProvider<List<BorrowerModel>>((ref) async {
  final borrowerService = ref.read(borrowerServiceprovider);
  print('$borrowerService');
  return borrowerService.fetchBorrowers();
});