import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String login, String senha) async {

    var url = Uri.https('example.com', 'whatsit/create');
    var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return true; 
  }
}