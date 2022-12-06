import 'package:flutter/material.dart';

// A widget that displays the picture taken by the user.
class DisplayNFTDetailsScreen extends StatelessWidget {
  final String imageUrl;
  final String nftName;

  const DisplayNFTDetailsScreen(
      {super.key, required this.imageUrl, required this.nftName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NFT Details')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('URL: ${imageUrl}'),
            SizedBox(
              height: 10,
            ),
            Text('Name: ${nftName}'),
          ],
        ),
      ),
    );
  }
}
