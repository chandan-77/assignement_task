import 'dart:convert';

import 'package:post/models/post_model.dart';
import 'package:http/http.dart' as http;

class Jsonservice {
final String baseUrl = "https://jsonplaceholder.typicode.com";

// feching the posts from api
Future<List<PostModel>> fetchPostsFromApi() async {
try {
final response = await http.get(Uri.parse("$baseUrl/posts"));
if (response.statusCode == 200) {
List data = json.decode(response.body);
return data.map((e) => PostModel.fromJson(e)).toList();
} else {
throw Exception("Failed to load posts");
}
} catch (e) {
throw Exception("Network error: $e");
}
}

// getting data base on id 
Future<PostModel> fetchPostDetailFromApi(int id) async {
try {
final response = await http.get(Uri.parse("$baseUrl/posts/$id"));
if (response.statusCode == 200) {
return PostModel.fromJson(json.decode(response.body));
} else {
throw Exception("Failed to load post details");
}
} catch (e) {
throw Exception("Network error: $e");
}
}
}