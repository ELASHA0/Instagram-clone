import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quit/Widgets/post_card.dart';
import 'package:quit/utiles/utils';
// import your PostCard widget

class FeedScreen extends StatelessWidget {
  FeedScreen({super.key});

  final List<Map<String, dynamic>> dummyPosts = [
    {
      'username': 'elonmusk',
      'userImageUrl': 'https://i.pravatar.cc/150?img=1',
      'postImageUrl':
          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg',
      'description': 'Going to Mars 🚀',
      'likeCount': 1234,
      'date': 'July 6, 2025',
    },
    {
      'username': 'natgeo',
      'userImageUrl': 'https://i.pravatar.cc/150?img=2',
      'postImageUrl':
          'https://images.pexels.com/photos/1624496/pexels-photo-1624496.jpeg',
      'description': 'Wildlife in action 🐅🌿',
      'likeCount': 2304,
      'date': 'July 5, 2025',
    },
    {
      'username': 'artdaily',
      'userImageUrl': 'https://i.pravatar.cc/150?img=3',
      'postImageUrl':
          'https://images.pexels.com/photos/167699/pexels-photo-167699.jpeg',
      'description': 'Brush strokes of freedom 🎨',
      'likeCount': 875,
      'date': 'July 4, 2025',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor, // Optional styling
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/images/ic_instagram.svg',
          height: 32,
          colorFilter: const ColorFilter.mode(
              Colors.white, BlendMode.srcIn), // if you want it white
        ),
      ),
      body: ListView.builder(
        itemCount: dummyPosts.length,
        itemBuilder: (context, index) {
          final post = dummyPosts[index];
          return PostCard(
            username: post['username'],
            userImageUrl: post['userImageUrl'],
            postImageUrl: post['postImageUrl'],
            description: post['description'],
            likeCount: post['likeCount'],
            date: post['date'],
          );
        },
      ),
    );
  }
}
