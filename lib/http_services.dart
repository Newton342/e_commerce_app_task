import 'package:http/http.dart' as http;

class HTTPServices {
  static Future<http.Response> getData(String api,
      {Map<String, dynamic>? parameters}) async {
    Uri url = Uri.https("fakestoreapi.com", api, parameters);
    // print([url.authority, url.path]);
    var response = await http.get(url);
    return response;
  }

  static Future<http.Response> postData(String api, {Map? parameters}) async {
    Uri url = Uri.https("fakestoreapi.com", api);
    var response = await http.post(url, body: parameters);
    return response;
  }
}
