import 'package:flutter/material.dart';
import 'package:post/providers/PostServcieProvider.dart';
import 'package:post/screens/DEtailScreen.dart';
import 'package:post/widgets/items.dart';
import 'package:provider/provider.dart';


class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
        centerTitle: true,
        elevation: 2,
      ),
      body: Consumer<PostProvider>(
        builder: (context, provider, child) {
          // adding loading circular progress indicator
          if (provider.isLoading && provider.posts.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          // Error state goes data
          if (provider.error != null && provider.posts.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    provider.error!,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () => provider.loadPosts(),
                    icon: const Icon(Icons.refresh),
                    label: const Text("Retry"),
                  )
                ],
              ),
            );
          }

          // Data state
          return RefreshIndicator(
            onRefresh: () async => provider.loadPosts(),
            child: ListView.separated(
              padding: const EdgeInsets.all(8.0),
              itemCount: provider.posts.length,
              separatorBuilder: (_, __) => const SizedBox(height: 6),
              itemBuilder: (context, index) {
                final post = provider.posts[index];
                return ItemWidget(
                  post: post,
                  isPaused: false,
                  onTap: () async {
                    provider.markAsRead(post.id);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(postId: post.id),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}