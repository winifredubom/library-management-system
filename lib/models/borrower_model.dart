class BorrowerModel {
  final int? id;
  final String name;
  final String email;
  final bool? isDeleted;
  final List<dynamic>? currentlyWithBooks;

  BorrowerModel({
     this.id,
    required this.name,
    required this.email,
     this.isDeleted,
     this.currentlyWithBooks,
  });

  factory BorrowerModel.fromJson(Map<String, dynamic> json) {
    return BorrowerModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      isDeleted: json['is_deleted'],
      currentlyWithBooks: json['currently_with_books'],
    );
  }
}
