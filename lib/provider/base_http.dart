import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class BaseHttp with ChangeNotifier {
  final Map<String, String> headerPadrao = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
  final Map<String, String> headerAutenticado = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Token': tokenJWT,
  };
  static String tokenJWT = "";

  static bool estaLogado() {
    return tokenJWT != "";
  }

  Future<http.Response> postPadrao(Object body, Uri url) async {
    return await post(body, headerPadrao, url);
  }

  Future<http.Response> postAutenticado(Object body, Uri url) async {
    return await post(body, headerAutenticado, url);
  }

  Future<http.Response> post(
      Object body, Map<String, String> headers, Uri url) async {
    http.Response resposta = null;

    await http
        .post(
      url,
      body: body,
      headers: headers,
    )
        .then((value) {
      resposta = value;
    });

    notifyListeners();
    return resposta;
  }
}
