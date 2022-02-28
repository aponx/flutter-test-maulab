import 'dart:convert';

import 'package:ajobthing/api/api_response.dart';
import 'package:ajobthing/api/api_service.dart';
import 'package:ajobthing/model/home.dart';

class HomeRepository {
  final ApiService _apiService = ApiService();

  Future<List<Home>> fetchHomeList() async {
    ApiResponse candidatesResponse = await _apiService.getCandidates();
    ApiResponse blogsResponse = await _apiService.getBlogs();
    final jsonCandidatesData = candidatesResponse.results as List;
    final jsonBlogsData = blogsResponse.results as List;
    List<Home> mediaList = jsonCandidatesData.map((e) => Home.fromCandidatesJson(e)).toList();
    mediaList.addAll(jsonBlogsData.map((tagJson) => Home.fromBlogsJson(tagJson)));
    return mediaList;
  }
}