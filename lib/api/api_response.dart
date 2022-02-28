import 'dart:convert';

class ApiResponse {
  dynamic results;

  ApiResponse({this.results});

  factory ApiResponse.fromJson(dynamic map) {
    return ApiResponse(
        results: map["results"]
    );
  }

  dynamic toJson() {
    return {"results": results};
  }

  @override
  String toString() {
    return 'Response{results: $results}';
  }
}

ApiResponse responseFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return ApiResponse.fromJson(data);
}

String responseToJson(ApiResponse data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
