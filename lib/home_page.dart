import 'package:flutter/material.dart';
import 'package:pertemuan3/sidemenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> thumbnails = [
    'https://images.unsplash.com/photo-1721332150382-d4114ee27eff?w=500',
    'https://images.unsplash.com/photo-1727108718939-55cffc2cf873?w=500',
    'https://images.unsplash.com/photo-1726820254128-642495548079?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1726534168836-59dff8524925?w=500',
    'https://images.unsplash.com/photo-1726557116827-5f2a95d57cab?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1726533870778-8be51bf99bb1?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1727306913165-b053fdf96248?q=80&w=1933&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1727229766396-efc10f50c169?q=80&w=1998&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1727190887587-af08ece60d3d?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1727108106361-a822fcbcdeed?q=80&w=1906&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double imageWidth = screenWidth / 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.black26,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageRow(imageWidth: imageWidth, firstImage: thumbnails[0], secondImage: thumbnails[1]),
            ImageRow(imageWidth: imageWidth, firstImage: thumbnails[2], secondImage: thumbnails[3]),
            ImageRow(imageWidth: imageWidth, firstImage: thumbnails[4], secondImage: thumbnails[5]),
            ImageRow(imageWidth: imageWidth, firstImage: thumbnails[6], secondImage: thumbnails[7]),
            ImageRow(imageWidth: imageWidth, firstImage: thumbnails[8], secondImage: thumbnails[9]),
          ],
        ),
      ),
      drawer: const Sidemenu(),
    );
  }
}

class ImageRow extends StatelessWidget {
  final double imageWidth;
  final String firstImage;
  final String secondImage;

  const ImageRow({
    Key? key,
    required this.imageWidth,
    required this.firstImage,
    required this.secondImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              width: imageWidth - 8,
              height: imageWidth - 8,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(firstImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              width: imageWidth - 8,
              height: imageWidth - 8,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(secondImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

