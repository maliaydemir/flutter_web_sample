// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class BaseModel {
  void fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    return {};
  }
}

class HttpBase {
  static HttpBase? _instance;

  HttpBase._();

  static HttpBase get instance {
    _instance ??= HttpBase._();
    return _instance!;
  }
  late String BASE_URL ='https://example-api.com';

  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  addHeader(Map<String, String> _param) {
    headers.addAll(_param);
  }

  setAuthToken(String _token) {
    headers.addAll({
      HttpHeaders.authorizationHeader: 'Bearer ' + _token.toString(),
    });
  }

  Future<int> post(String url,
      {dynamic bodyData, void Function(Response response)? callBack}) async {
    var uri = Uri.parse(BASE_URL + url);
    try {
      var resp =
          await http.post(uri, headers: headers, body: jsonEncode(bodyData));

      if (callBack != null) callBack(resp);
      return resp.statusCode;
    } catch (e) {
      print(e);
      if (callBack != null) callBack(http.Response(e.toString(), 500));
      return 500;
    }
  }

  Future<Response> get(String url) async {
    try {
      final result = await http.get(
        Uri.parse(BASE_URL + url),
        headers: headers,
      );
      return result;
    } catch (e) {
      print(e);
      return http.Response(e.toString(), 500);
    }
  }

  Future<bool> postForm(String url,
      {Map<String, String>? fields, File? file}) async {
    var uri = Uri.parse(BASE_URL + url);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(await headers);
    if (file != null) {
      request.files.add(await http.MultipartFile.fromPath('file', file.path));
    }
    if (fields != null) request.fields.addAll(fields);
    var response = await request.send();
    return response.statusCode == 200;
  }
}
