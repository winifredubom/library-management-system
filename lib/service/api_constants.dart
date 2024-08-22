const baseUrl="https://app-5tr2i5vuja-uc.a.run.app";


 class BooksApi{
 static const addBookApi= '$baseUrl/api/add-book/' ;
 static const deleteBookApi="$baseUrl/api/delete-book/:id/";
 static const getBookApi="$baseUrl/api/get-book/:id/";   
 static const getBooksApi = "$baseUrl/api/get-books/";
 static const updateBookApi = "$baseUrl/api/update-book/:id/";
}



 class BorrowersApi{
  static const addBorrowerApi= '$baseUrl/api/add-borrower/' ;
 static const deleteBorrowerApi="$baseUrl/api/delete-borrower/:id/";
 static const getBorrowerApi="$baseUrl/api/get-borrower/:id/";   
 static const getBorrowersApi = "$baseUrl/api/get-borrowers/";
 static const updateBorrowerApi = "$baseUrl/api/update-borrower/:id/";

}

class BorrowingHistory{
  static const getBorrowerHistoryApi= '$baseUrl/api/get-borrowing-history/' ;
}

class SuperAdmin{
  static const getJSONDataApi = '$baseUrl/api/get-json-data/';
}

