/*import 'package:flutter/material.dart';
import 'package:quit/utiles/utils';

class GridGalleryScreen extends StatelessWidget {
  const GridGalleryScreen({super.key});

  final List<String> dummyImages = const [
    'https://images.unsplash.com/photo-1580887083090-fc27c4f436cf',
    'https://images.unsplash.com/photo-1586015559033-bcbb455b75d1',
    'https://images.unsplash.com/photo-1579546929518-9e396f3cc809',
    'https://images.unsplash.com/photo-1581093588401-efb52eac61ae',
    'https://images.unsplash.com/photo-1580894894513-fc0f7fb4ed2a',
    'https://images.unsplash.com/photo-1504384308090-c894fdcc538d',
    'https://images.unsplash.com/photo-1618083700116-bf0ee0d6f1e4',
    'https://images.unsplash.com/photo-1529579134665-d1f37bafad46',
    'https://images.unsplash.com/photo-1504384308090-c894fdcc538d',
    'https://images.unsplash.com/photo-1618083700116-bf0ee0d6f1e4',
    'https://images.unsplash.com/photo-1579546929518-9e396f3cc809',
    'https://images.unsplash.com/photo-1586015559033-bcbb455b75d1',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text("Explore"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: GridView.builder(
          itemCount: dummyImages.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return Image.network(
              dummyImages[index],
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
*/
