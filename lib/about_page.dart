import 'package:flutter/material.dart';
import 'package:pertemuan3/sidemenu.dart';

class AboutPage extends StatelessWidget {
  const AboutPage ({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page'),
      ),
      body: Stack(
        children: [
          // Background Image
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.network(
                'https://images.unsplash.com/photo-1726165534067-89ac61b5f0ef?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              ),
            ),
          ),
          // Container with TextField in the center
          Center(
            child: Container(
              padding: const EdgeInsets.all(16.0), // Padding for the Container
              width: 300, // Set width of the container
              height: 250, // Set height of the container
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(16),

              ),
              child: Text('This app intends to copy the Pixiv mobile app. In Home section, you can see '
                  'a gallery of stock images. Those are just thumbnails. Unfortunately, this app '
                  'cannot view those images in full size. Supposedly you can also like the images,'
                  'but it still cannot be done.'
                  ,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 17
                  ),
              ),
            ),
          ),
        ],
      ),
      drawer: const Sidemenu(),
    );
  }
}