import 'package:flutter/material.dart';
import 'package:quit/screens/comment.dart';
import 'package:quit/utiles/utils';

import 'package:quit/widgets/like_animation.dart';

class PostCard extends StatefulWidget {
  final String username;
  final String userImageUrl;
  final String postImageUrl;
  final String description;
  final int likeCount;
  final String date;

  const PostCard({
    super.key,
    required this.username,
    required this.userImageUrl,
    required this.postImageUrl,
    required this.description,
    required this.likeCount,
    required this.date,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLikeAnimating = false;
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mobileBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          // --- User header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
                .copyWith(right: 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(widget.userImageUrl),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.username,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shrinkWrap: true,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                child: const Text('Delete'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),
          ),

          // --- Image Section with Like Animation
          GestureDetector(
            onDoubleTap: () {
              setState(() {
                isLiked = true;
                isLikeAnimating = true;
              });
              Future.delayed(const Duration(milliseconds: 700), () {
                setState(() {
                  isLikeAnimating = false;
                });
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  child: Image.network(
                    widget.postImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 400),
                  opacity: isLikeAnimating ? 1 : 0,
                  child: LikeAnimation(
                    isAnimating: isLikeAnimating,
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // --- Like, Comment, Send, Bookmark
          Row(
            children: [
              LikeAnimation(
                isAnimating: isLiked,
                smallLike: true,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.white,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const CommentScreen()),
                ),
                icon: const Icon(Icons.comment_outlined, color: Colors.white),
              ),
              const IconButton(
                onPressed: null,
                icon: Icon(Icons.send, color: Colors.white),
              ),
              const Spacer(),
              const IconButton(
                onPressed: null,
                icon: Icon(Icons.bookmark_border, color: Colors.white),
              ),
            ],
          ),

          // --- Likes and Description
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isLiked
                      ? '${widget.likeCount + 1} likes'
                      : '${widget.likeCount} likes',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 8),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: primaryColor),
                      children: [
                        TextSpan(
                          text: '${widget.username} ',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: widget.description,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'View all 200 comments',
                  style: TextStyle(fontSize: 16, color: secondaryColor),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.date,
                  style: const TextStyle(fontSize: 16, color: secondaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
