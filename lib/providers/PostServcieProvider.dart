import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:post/models/post_model.dart';
import 'package:post/services/JsonService.dart';
import 'package:post/services/sharedservice.dart';
// import 'package:provider/provider.dart';

class PostProvider extends ChangeNotifier {
final Jsonservice jsonservice;
final SharedService sharedService;
List<PostModel> posts = [];
bool isLoading = false;
String? error;


PostProvider(this.jsonservice, this.sharedService);

//loading the post datas
Future<void> loadPosts() async {
isLoading = true;
notifyListeners();


try {
// Load data from shared preferences 
posts = await sharedService.getPostsData();
notifyListeners();


// fetching the api datas
final newPosts = await jsonservice.fetchPostsFromApi();
log( "Fetched ${newPosts.length} posts from API");
posts = newPosts;
await sharedService.savePostsData(posts);
} catch (e) {
error = e.toString();
} finally {
isLoading = false;
notifyListeners();
}
}

// marking data as read`
void markAsRead(int id) {
final index = posts.indexWhere((p) => p.id == id);
if (index != -1) {
posts[index].isRead = true;
sharedService.savePostsData(posts);
notifyListeners();
log("Post $id marked as read");
}
}
}