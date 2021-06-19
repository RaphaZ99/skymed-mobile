import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:skymed_mobile/model/paciente.dart';

class BaseHttp with ChangeNotifier {
  final Map<String, String> headerPadrao = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
  Map<String, String> getHeaderAutenticado() {
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $tokenJWT',
    };
  }

  static final baseUrl = 'https://skymed-api.herokuapp.com';
  static String tokenJWT = "";
  static String usuarioEmail = "";

  static bool estaLogado() {
    return tokenJWT != "";
  }

  Future<http.Response> postPadrao(Object body, Uri url) async {
    return await post(body, headerPadrao, url);
  }

  Future<http.Response> postAutenticado(Object body, Uri url) async {
    return await post(body, getHeaderAutenticado(), url);
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

  Future<http.Response> putPadrao(Object body, Uri url) async {
    return await put(body, headerPadrao, url);
  }

  Future<http.Response> putAutenticado(Object body, Uri url) async {
    return await put(body, getHeaderAutenticado(), url);
  }

  Future<http.Response> put(
      Object body, Map<String, String> headers, Uri url) async {
    http.Response resposta = null;

    await http
        .put(
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

  Future<http.Response> deletePadrao(Object body, Uri url) async {
    return await post(body, headerPadrao, url);
  }

  Future<http.Response> deleteAutenticado(Object body, Uri url) async {
    return await post(body, getHeaderAutenticado(), url);
  }

  Future<http.Response> delete(
      Object body, Map<String, String> headers, Uri url) async {
    http.Response resposta = null;

    await http
        .delete(
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

  Future<http.Response> getPadrao(Uri url) async {
    return await get(headerPadrao, url);
  }

  Future<http.Response> getAutenticado(Uri url) async {
    return await get(getHeaderAutenticado(), url);
  }

  Future<http.Response> get(Map<String, String> headers, Uri url) async {
    http.Response resposta = null;

    await http
        .get(
      url,
      headers: headers,
    )
        .then((value) {
      resposta = value;
    });

    notifyListeners();
    return resposta;
  }
}
