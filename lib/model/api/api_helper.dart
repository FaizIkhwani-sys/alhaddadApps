import 'dart:convert';
import 'dart:io';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as pathy;
import 'package:shared_preferences/shared_preferences.dart';

import 'api_exception.dart';

class APIHelper {
  late Dio _dio;
  static const interval = 15;

  APIHelper() {
    _dio = Dio();
  }

  void setupHeader({String? accessToken}) {
    _dio.options.headers = {
      'Accept': 'application/json; charset=UTF-8',
      'Content-Type': 'application/json; charset=UTF-8',
      if (!accessToken.isNullOrWhiteSpace)
        'Authorization': 'Bearer $accessToken'
    };
  }

  Future<T> getRequest<T>({
    required String hostUrl,
    required String path,
    Map<String, String>? queryParameters,
    // String? accessToken,
  }) async {
    try {
      // setupHeader(accessToken: accessToken!);
      // print(queryParameters);
      print(hostUrl + path);
      final response = await _dio
          .get(
        hostUrl + path,
        queryParameters: queryParameters,
      )
          .timeout(const Duration(seconds: interval), onTimeout: () {
        throw FetchDataException('the connection has timed out');
      });

      return _returnResponse<T>(response, null);
    } on SocketException {
      throw Exception('unable to reach server');
    } on DioError catch (e) {
      return _returnResponse<T>(e.response!, null);
    }
  }

  Future<T> getRequestWithToken<T>({
    required String hostUrl,
    required String path,
    Map<String, String>? queryParameters,
    String? accessToken,
  }) async {
    try {
      setupHeader(accessToken: accessToken);
      print('access token $accessToken');
      final response = await _dio
          .get(
        hostUrl + path,
        queryParameters: queryParameters,
      )
          .timeout(const Duration(seconds: interval), onTimeout: () {
        throw FetchDataException('the connection has timed out');
      });
      // print('query $queryParameters');
      print('url pulak ${hostUrl + path + queryParameters.toString()}');
      //
      print('get repo $response');
      return _returnResponse<T>(response, null);
    } on SocketException {
      throw Exception('unable to reach server');
    } on DioError catch (e) {
      return _returnResponse<T>(e.response!, null);
    }
  }

  Future<T> postRequest<T>({
    required String hostUrl,
    required String path,
    Map<String, String>? queryParameters,
    Map<String, String>? data,
    // String? accessToken,
  }) async {
    try {
      // setupHeader(accessToken: accessToken);
      print('data $data');
      final response = await _dio.post(
        hostUrl + path,
        queryParameters: queryParameters,
        data: data,
      );

      return _returnResponse<T>(response, null);
    } on SocketException {
      throw Exception('unable to reach server');
    } on DioError catch (e) {
      return _returnResponse<T>(e.response, e.message);
    }
  }

  Future<T> postRequestWithToken<T>({
    required String hostUrl,
    required String path,
    Map<String, String>? queryParameters,
    Map<String, String>? data,
    String? accessToken,
  }) async {
    print('postRequest ${hostUrl + path}');
    try {
      setupHeader(accessToken: accessToken);
      print("bearer token : $accessToken");
      final response = await _dio.post(
        hostUrl + path,
        queryParameters: queryParameters,
        data: data,
      );
      print(data);
      print('postRequest ${hostUrl + path}');

      return _returnResponse<T>(response, null);
    } on SocketException {
      throw Exception('unable to reach server');
    } on DioError catch (e) {
      return _returnResponse<T>(e.response, e.message);
    }
  }

  Future<T> updateRequest<T>({
    required String hostUrl,
    required String path,
    Map<String, String>? queryParameters,
    Map<String, String>? data,
    String? accessToken,
  }) async {
    try {
      print(hostUrl + path);
      //setupHeader(accessToken: accessToken);
      final response = await _dio.put(
        hostUrl + path,
        queryParameters: queryParameters,
        data: data,
      );
      return _returnResponse<T>(response, null);
    } on SocketException {
      throw Exception('unable to reach server');
    } on DioError catch (e) {
      return _returnResponse<T>(e.response, e.message);
    }
  }

  Future<T> updateRequestWithToken<T>({
    required String hostUrl,
    required String path,
    Map<String, String>? queryParameters,
    Map<String, String>? data,
    String? accessToken,
  }) async {
    try {
      print(hostUrl + path);
      print('bearer $accessToken');
      setupHeader(accessToken: accessToken);
      final response = await _dio.put(
        hostUrl + path,
        queryParameters: queryParameters,
        data: data,
      );

      print("data $data");
      return _returnResponse<T>(response, null);
    } on SocketException {
      throw Exception('unable to reach server');
    } on DioError catch (e) {
      return _returnResponse<T>(e.response, e.message);
    }
  }

  Future<T> patchRequest<T>({
    required String hostUrl,
    required String path,
    Map<String, String>? queryParameters,
    Map<String, dynamic>? data,
    String? accessToken,
  }) async {
    try {
      setupHeader(accessToken: accessToken!);
      final response = await _dio
          .patch(
        hostUrl + path,
        queryParameters: queryParameters,
        data: data,
      )
          .timeout(const Duration(seconds: interval), onTimeout: () {
        throw FetchDataException('the connection has timed out');
      });

      return _returnResponse<T>(response, null);
    } on SocketException {
      throw Exception('Unable to reach server, please check your connection.');
    } on DioError catch (e) {
      return _returnResponse<T>(e.response!, e.message);
    }
  }

  Future<T> deleteRequestWithToken<T>({
    required hostUrl,
    required path,
    Map<String, String>? queryParameters,
    String? accessToken,
  }) async {
    try {
      print(hostUrl + path);
      print('bearer $accessToken');
      setupHeader(accessToken: accessToken);
      final response = await _dio.delete(
        hostUrl + path,
        queryParameters: queryParameters,
      );
      return _returnResponse<T>(response, null);
    } on SocketException {
      throw Exception('unable to reach server');
    } on DioError catch (e) {
      return _returnResponse<T>(e.response, e.message);
    }
  }

  Future<T> uploadRequest<T>({
    required String hostUrl,
    required String path,
    required File file,
    String? collection,
    Map<String, String>? queryParameters,
    String? accessToken,
  }) async {
    try {
      var uri = Uri.parse(hostUrl + path);
      var postUri = Uri.https(uri.authority, uri.path, queryParameters);
      var request = http.MultipartRequest('POST', postUri);
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/x-www-form-urlencoded';
      request.fields['dos_vaksin'] = collection!;
      // ignore: deprecated_member_use
      var stream = http.ByteStream(DelegatingStream.typed(file.openRead()));
      var length = await file.length();
      var multipartFile = http.MultipartFile(
        'media',
        stream,
        length,
        filename: pathy.basename(file.path),
      );
      request.files.add(multipartFile);

      var response = await request.send().timeout(
        const Duration(seconds: interval),
        onTimeout: () {
          throw FetchDataException('the connection has timed out');
        },
      );

      var value = await response.stream.single;
      var returnResponse = Response(
        data: json.decode(utf8.decode(value)),
        statusCode: response.statusCode,
        requestOptions: RequestOptions(
          baseUrl: hostUrl,
          path: path,
        ),
      );

      return _returnResponse<T>(returnResponse, null);
    } on SocketException {
      throw Exception('Unable to reach server, please check your connection.');
    } on DioError catch (e) {
      return _returnResponse<T>(e.response!, e.message);
    }
  }

  T _returnResponse<T>(Response? response, String? errorMessage) {
    if (response == null || response.statusCode == null) {
      throw FetchDataException(errorMessage ?? 'An Exception occurs.');
    }

    switch (response.statusCode) {
      case 200:
      case 201:
      case 204:
      case 302:
        return response.data;
      case 400:
      case 422:
        throw BadRequestException(
          json.encode(response.data),
          response.statusCode,
        );
      case 401:
      case 403:
        throw UnauthorisedException(
          json.encode(response.data),
          response.statusCode,
        );
      case 404:
        throw NotFoundException(
          json.encode(response.data),
          response.statusCode,
        );
      case 409:
        throw UnauthorisedException(
          json.encode(response.data),
          response.statusCode,
        );
      case 500:
      default:
        throw FetchDataException(
          json.encode(response.data),
          response.statusCode,
        );
    }
  }
}
