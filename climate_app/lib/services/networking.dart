import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper
{
  NetworkHelper({required this.url});

  final String url;

  Future getData() async{
    try {

      //String apiUrl = ;

      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        String data = response.body;

        var decode = jsonDecode(data);
        return decode;
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }

  }


}
