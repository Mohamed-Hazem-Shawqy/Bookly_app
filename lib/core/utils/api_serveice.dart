// هو ده ال rapper بتاعى
// api بحط فيه كل مل يخص ال ( )
// api service عباره عن نقطه التواصل بينى وبين ال

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final _apiKey = dotenv.env['API_KEY'];
  final _baseurl = "https://www.googleapis.com/books/v1/";
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get("$_baseurl$endPoint&key=$_apiKey");
    return response.data;
  }
}
