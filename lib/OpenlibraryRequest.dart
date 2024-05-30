import 'package:http/http.dart' as http;

class OpenLibraryRequest{


  var client = http.Client();

  Future<dynamic> getImage(String isbn) async{
    var url = Uri.parse("https://covers.openlibrary.org/b/isbn/$isbn-M.jpg");
    var response = await client.get(url);

    if(response.statusCode == 200){
      return response.body;
    }
  }
}