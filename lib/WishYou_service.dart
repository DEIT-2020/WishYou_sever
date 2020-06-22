import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';


class WishYouService {
  static final _headers = {'Content-Type': 'application/json'};
  static const _heroesUrl = 'api/heroes'; // URL to web API

  final Client _http;

  WishYouService(this._http);



  dynamic _extractData(Response resp) => json.decode(resp.body)['data'];

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return Exception('Server error; cause: $e');
  }


  Future<void> delete(int id) async {
    try {
      final url = '$_heroesUrl/$id';
      await _http.delete(url, headers: _headers);
    } catch (e) {
      throw _handleError(e);
    }
  }
}
