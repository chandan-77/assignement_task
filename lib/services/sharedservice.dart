import 'dart:convert';

import 'package:post/models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
final String key = "posts";

// persisting the post data in shared preferences
Future<void> savePostsData(List<PostModel> posts) async {
final prefs = await SharedPreferences.getInstance();
List<String> encoded = posts.map((p) => json.encode(p.toJson())).toList();
await prefs.setStringList(key, encoded);
}

// getting back the data from shared sercvee
Future<List<PostModel>> getPostsData() async {
final prefs = await SharedPreferences.getInstance();
List<String>? data = prefs.getStringList(key);
if (data != null) {
return data.map((e) => PostModel.fromJson(json.decode(e))).toList();
}
return [];
}
}