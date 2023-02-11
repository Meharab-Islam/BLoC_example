// ignore_for_file: unused_field, prefer_final_fields

import 'package:bloc_practice/api/apiModel.dart';
import 'package:dio/dio.dart';

class ApiResponse {
  Dio _dio = Dio();

  Future<List<ApiModel>> fetchData() async {
    try {
      var response = await _dio.get(
          'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=d18789d504e647bb9e813c2771d16652');

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> map = response.data;

        List _articlesList = map['articles'];

        List<ApiModel> newsList = _articlesList
            .map((jsonData) => ApiModel.fromJson(jsonData))
            .toList();

        print(_articlesList);
        return newsList;
      } else {
        print('error');
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
