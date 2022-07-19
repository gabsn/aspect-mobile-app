import 'package:flutter/material.dart';

// A widget that displays the picture taken by the user.
class DisplayNFTDetailsScreen extends StatelessWidget {
  const DisplayNFTDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NFT Details')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: const Center(
        child: Text('Display NFT Details'),
      ),
    );
  }
}
