import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class NetworkHandler {
  static final NetworkHandler _instance = NetworkHandler._internal();
  NetworkHandler._internal();
  factory NetworkHandler() => _instance;
  final String _baseUrl = "https://maroc-reclamation-demo.herokuapp.com/api/";
  final Dio _dio = Dio();

  String _generatRequestUrl(String url) {
    return _baseUrl + url;
  }

  Options _generateOptions() {
    String token = GetStorage().read("id_token") ?? "";
    return Options(
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Sec-Fetch-Mode": "cors",
        "Sec-Fetch-Site": "same-origin",
        "Authorization": "Bearer $token",
      },
    );
  }

  Future<Response> get(String route, String token) async {
    Response response;
    try {
      response = await _dio.get(
        _generatRequestUrl(route),
        options: _generateOptions(),
      );
    } on DioError {
      rethrow;
    }
    return response;
  }

  Future<Response> post(String route, Map<String, dynamic> data) async {
    Response response;

    try {
      response = await _dio.post(
        _generatRequestUrl(route),
        data: data,
        options: _generateOptions(),
      );
    } on DioError {
      rethrow;
    }
    return response;
  }
}
