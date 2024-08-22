class BookModel {
  final int? id;
  final String name;
  final int isbn;
  final String authorName;
  final String? createdAt;
  final String? currentlyWithBorrower;
  final bool? isDeleted;

  BookModel({
     this.id,
    required this.name,
    required this.isbn,
    required this.authorName,
     this.createdAt,
    this.currentlyWithBorrower,
     this.isDeleted,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      name: json['name'],
      isbn: json['isbn'],
      authorName: json['author_name'],
      createdAt: json['created_at'],
      currentlyWithBorrower: json['currently_with_borrower'],
      isDeleted: json['is_deleted'],
    );
  }
}
