import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginApi {
  Future<String> postData(String username, String password) async {
    final url = Uri.parse('https://cachorros-api.onrender.com/login');
    final headers = {'Content-Type': 'application/json'};
    final Map<String, String> body = {
      'username': username,
      'password': password,
    };

    // Encode the body as JSON
    final String jsonBody = jsonEncode(body);

    final response = await http.post(url, headers: headers, body: jsonBody);

    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      if (decodedData['status'] == 'Ok') {
        return decodedData['message'];
      } else {
        return 'Erro na autenticação';
      }
    } else {
      return 'Erro ${response.statusCode}';
    }
  }
}
