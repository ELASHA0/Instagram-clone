import 'package:flutter/material.dart';
import 'package:quit/Widgets/comment_card.dart';
import 'package:quit/utiles/utils';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final List<Map<String, String>> dummyComments = [
    {
      'username': 'alice',
      'comment': 'This is so beautiful!',
      'date': '01/07/25',
      'profilePic': 'https://i.pravatar.cc/150?img=1',
    },
    {
      'username': 'bob',
      'comment': 'Amazing photo 👏',
      'date': '02/07/25',
      'profilePic': 'https://i.pravatar.cc/150?img=2',
    },
    {
      'username': 'charlie',
      'comment': 'Love the colors 😍',
      'date': '03/07/25',
      'profilePic': 'https://i.pravatar.cc/150?img=3',
    },
    {
      'username': 'diana',
      'comment': 'Stunning composition!',
      'date': '04/07/25',
      'profilePic': 'https://i.pravatar.cc/150?img=4',
    },
    {
      'username': 'eve',
      'comment': 'So peaceful 🌸',
      'date': '05/07/25',
      'profilePic': 'https://i.pravatar.cc/150?img=5',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('Comment'),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: dummyComments.length,
        itemBuilder: (context, index) {
          final data = dummyComments[index];
          return CommentCard(
            username: data['username']!,
            comment: data['comment']!,
            date: data['date']!,
            profilePic: data['profilePic']!,
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          padding: const EdgeInsets.only(left: 60, right: 8),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/697259/pexels-photo-697259.jpeg'),
                radius: 18,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Comment as username',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: const Text(
                    'Post',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
