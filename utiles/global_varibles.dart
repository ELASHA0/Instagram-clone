import 'package:flutter/material.dart';
import 'package:quit/screens/add_post_screen.dart';
import 'package:quit/screens/feed_screen.dart';
import 'package:quit/screens/profile_screen.dart';
import 'package:quit/screens/search_screen.dart';

const webScreenSize = 600;
final homeScreenItems = [
  FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const Text("notify"),
  const ProfileScreen(),
];
