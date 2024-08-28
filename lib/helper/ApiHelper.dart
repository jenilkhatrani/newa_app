import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newa_app/constants.dart';

class APIHelper {
  APIHelper._();
  static APIHelper apiHelper = APIHelper._();

  Future<List?> articles() async {
    http.Response response = await http.get(Uri.parse(NewsApi));

    if (response.statusCode == 200) {
      String body = response.body;

      Map decodedData = jsonDecode(body);
    }
    return null;
  }
}
