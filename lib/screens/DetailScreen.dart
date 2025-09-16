import 'package:flutter/material.dart';
import 'package:post/models/post_model.dart';
import 'package:post/services/JsonService.dart';

class DetailScreen extends StatelessWidget {
  final int postId;
  const DetailScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    final api = Jsonservice();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Detail"),
        centerTitle: true,
        elevation: 2,
      ),
      body: FutureBuilder<PostModel>(
        future: api.fetchPostDetailFromApi(postId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          if (!snapshot.hasData) {
            return const Center(child: Text("No data available"));
          }

          final post = snapshot.data!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  post.title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                ),
                const SizedBox(height: 12),

                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      post.body,
                      style: const TextStyle(fontSize: 16, height: 1.5),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
