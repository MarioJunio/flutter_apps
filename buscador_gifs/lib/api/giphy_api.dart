import 'dart:convert';

import 'package:http/http.dart' as http;

class GiphyApi {
  static final String host = "https://api.giphy.com/v1/gifs";

  static Future<Map> _trending() async {
    http.Response response = await http.get(
        "$host/trending?api_key=W91kTGxvqfpjJnYB0tnY3sUt5nmKGD1C&limit=25&rating=G");

    return json.decode(response.body);
  }

  static Future<Map> search({String text, int offset = 0}) async {
    if (text == null || text.isEmpty)
      return _trending();
    else
      return json.decode((await http.get(
              "$host/search?api_key=W91kTGxvqfpjJnYB0tnY3sUt5nmKGD1C&q=$text&limit=25&offset=$offset&rating=G&lang=pt"))
          .body);
  }
}
