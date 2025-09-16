import 'package:flutter/material.dart';
import 'package:post/models/post_model.dart';
import 'package:post/widgets/duration.dart';

class ItemWidget extends StatelessWidget {
  final PostModel post;
  final VoidCallback onTap;
  final bool isPaused;

  const ItemWidget({
    super.key,
    required this.post,
    required this.onTap,
    required this.isPaused,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: post.isRead ? Colors.white : Colors.yellow[100],
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      post.body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),

            
              DurationWidget(
                duration: post.duration, 
                isPaused: isPaused,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
