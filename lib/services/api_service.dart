import 'dart:convert';
import 'dart:io';
import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;

import 'app_exception.dart';

class ApiService {
// developer url
  static String _baseUrl = "https://supplieson.com/api/";

  static Uri _getUrl(String methodName) {
    return Uri.parse(_baseUrl + methodName);
  }

  /// GET
  static Future<dynamic> get(String url,
      {Map<String, String> headerMap}) async {
    dynamic responseJson;
    print(_getUrl(url));

    try {
      var response;
      if(headerMap==null) {
        response = await http.get(_getUrl(url));
      }
      else{
         response = await http.get(_getUrl(url), headers: headerMap);
      }
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  /// POST
  static Future<dynamic> post(String url,
      {Map<String, dynamic> params, Map<String, String> headerMap}) async {
    dynamic responseJson;
    print(_getUrl(url));
    print(params);
    try {
      if (params == null) {
        throw FetchDataException('Parameters cannot be null');
      }
      var response;
      if(headerMap==null) {
        response = await http.post(_getUrl(url),body: params,);
      }
      else{
        response = await http.post(_getUrl(url), headers: headerMap,body: params,);
      }
      /*var response = await http.post(_getUrl(url),
          body: params, headers: headerMap != null ? headerMap : appHeaderMap);*/

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  ///  PUT
  static Future<dynamic> put(String url,
      {Map<String, String> params, Map<String, String> headerMap}) async {
    dynamic responseJson;
    print(_getUrl(url));
    try {
      var response;
      if (params == null) {
        response = await http.put(_getUrl(url), headers: headerMap);
      } else {
        response =
            await http.put(_getUrl(url), body: params, headers: headerMap);
      }

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  ///DELETE

  static Future<dynamic> delete(String url,
      {Map<String, String> headerMap,Map<String, dynamic> params}) async {
    dynamic responseJson;
    print(_getUrl(url));
    try {
      var response;
      if(headerMap==null) {
        response = await http.delete(_getUrl(url));
      }
      else{
        response = await http.delete(_getUrl(url), headers: headerMap,body: params);
      }
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }


  @visibleForTesting
  static dynamic returnResponse(http.Response response) {
    dynamic responseJson = jsonDecode(response.body);
   // print(response.body.toString());

    int statusCode;
    if (responseJson['code'] != null) {
      statusCode = responseJson['code'] as int;
    } else {
      statusCode = response.statusCode;
    }
    switch (/*response.statusCode*/ statusCode) {
      case 200:
        /*dynamic responseJson = jsonDecode(response.body);*/
        return responseJson;
      case 400:
        throw BadRequestException(/*response.body.toString()*/
            responseJson['message']);
      case 401:
        throw BadRequestException(/*response.body.toString()*/
            responseJson['message']);
      case 403:
        throw UnauthorisedException(/*response.body.toString()*/
            responseJson['message']);
      case 500:
        throw UnauthorisedException(/*response.body.toString()*/
            responseJson['message']);
      case 404:
        throw BadRequestException(/*response.body.toString()*/
            responseJson['message']);

      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
