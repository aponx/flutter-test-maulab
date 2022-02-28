import 'package:http/http.dart' show Client;

import 'api_response.dart';

class ApiService {

  final String baseUrl = "https://private-b9a758-candidattest.apiary-mock.com";

  Client client = Client();

  Future<ApiResponse> getCandidates() async {
    final response = await client.get(
      Uri.parse("$baseUrl/candidates"),
      headers: {"content-type": "application/json"}
    );

    ApiResponse res = responseFromJson(response.body);
    return res;
  }

  Future<ApiResponse> getBlogs() async {
    final response = await client.get(
        Uri.parse("$baseUrl/blogs"),
        headers: {"content-type": "application/json"}
    );

    ApiResponse res = responseFromJson(response.body);
    return res;
  }
}