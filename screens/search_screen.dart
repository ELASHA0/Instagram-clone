import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:quit/utiles/utils';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  final List<String> pexelsImages = [
    'https://images.pexels.com/photos/799443/pexels-photo-799443.jpeg',
    'https://images.pexels.com/photos/2033997/pexels-photo-2033997.jpeg',
    'https://images.pexels.com/photos/1903702/pexels-photo-1903702.jpeg',
    'https://images.pexels.com/photos/1040626/pexels-photo-1040626.jpeg',
    'https://images.pexels.com/photos/1020016/pexels-photo-1020016.jpeg',
    'https://images.pexels.com/photos/132037/pexels-photo-132037.jpeg',
    'https://images.pexels.com/photos/145939/pexels-photo-145939.jpeg',
    'https://images.pexels.com/photos/66997/pexels-photo-66997.jpeg',
    'https://images.pexels.com/photos/949587/pexels-photo-949587.jpeg',
    'https://images.pexels.com/photos/36762/scarlet-honeyeater-bird-red-feathers.jpg',
    'https://images.pexels.com/photos/2480807/pexels-photo-2480807.jpeg',
    'https://images.pexels.com/photos/60575/smoke-smoking-chimney-fireplace-60575.jpeg',
    'https://images.pexels.com/photos/220201/pexels-photo-220201.jpeg',
    'https://images.pexels.com/photos/2768961/pexels-photo-2768961.jpeg',
    'https://images.pexels.com/photos/2533743/pexels-photo-2533743.jpeg',
    'https://images.pexels.com/photos/3186574/pexels-photo-3186574.jpeg',
    'https://images.pexels.com/photos/5368119/pexels-photo-5368119.jpeg',
    'https://images.pexels.com/photos/691467/art-smoke-light-lights-691467.jpeg',
    'https://images.pexels.com/photos/2409022/pexels-photo-2409022.jpeg',
    'https://images.pexels.com/photos/1743165/pexels-photo-1743165.jpeg',
    'https://images.pexels.com/photos/14513735/pexels-photo-14513735.jpeg',
    'https://images.pexels.com/photos/4220967/pexels-photo-4220967.jpeg',
    'https://images.pexels.com/photos/5117913/pexels-photo-5117913.jpeg',
    'https://images.pexels.com/photos/30180323/pexels-photo-30180323.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/30051039/pexels-photo-30051039.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/30066799/pexels-photo-30066799.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/30115943/pexels-photo-30115943.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/30147671/pexels-photo-30147671.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/29829698/pexels-photo-29829698.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/30077898/pexels-photo-30077898.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/30075352/pexels-photo-30075352.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/30056441/pexels-photo-30056441.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/15254640/pexels-photo-15254640.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/20376473/pexels-photo-20376473.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/29734210/pexels-photo-29734210.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/2480807/pexels-photo-2480807.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/2570304/pexels-photo-2570304.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/1323712/pexels-photo-1323712.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/2447036/pexels-photo-2447036.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/5499898/pexels-photo-5499898.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/1369368/pexels-photo-1369368.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/2124702/pexels-photo-2124702.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/2496606/pexels-photo-2496606.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/2409022/pexels-photo-2409022.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/5564549/pexels-photo-5564549.jpeg',
    'https://images.pexels.com/photos/5592126/pexels-photo-5592126.jpeg',
    'https://images.pexels.com/photos/5592094/pexels-photo-5592094.jpeg',
    'https://images.pexels.com/photos/5607661/pexels-photo-5607661.jpeg',
    'https://images.pexels.com/photos/5607651/pexels-photo-5607651.jpeg',
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: TextFormField(
          controller: searchController,
          decoration: const InputDecoration(
            labelText: 'Search for a user',
            border: InputBorder.none,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: MasonryGridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemCount: pexelsImages.length,
          itemBuilder: (context, index) {
            return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  pexelsImages[index],
                  fit: BoxFit.cover,
                  errorBuilder: (ctx, e, st) => const Icon(Icons.broken_image),
                ));
          },
        ),
      ),
    );
  }
}
