/// --------------------------------------------------
/// home_screen_logic.dart
///
/// -> All logic related to home_screen goes here
/// --------------------------------------------------
///
/// Imports ------------------------------------------
/// Model
import 'package:aspect_mobile_app/model/constants/constants.dart';
import 'package:aspect_mobile_app/model/services/aspect_api_services/aspect_api_services.dart';
import 'package:aspect_mobile_app/model/services/service_locator.dart';
import 'package:aspect_mobile_app/model/data/nft_metadata.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../nft/nft_details_screen.dart';

/// Imports ------------------------------------------

Future<List> loadNFTAssetsFromAspect({int limit = 20}) async {
  try {
    final dataAssets = [];

    final response =
        await getIt<AspectAPIService>().getAspectAssets(limit: limit);

    final List nftAssets = response[0]['assets'];

    //Convert Assets to Data Objects
    for (var element in nftAssets) {
      print(element['name'].toString());
      print(element['image_small_url_copy'].toString());
      dataAssets.add(
        NFTMetadata(
          nftName: element['name'].toString(),
          nftCollectionName: '',
          nftOwnerAccountAddress:
              element['owner']['account_address'].toString(),
          nftDescription: element['description'].toString(),
          nftImageURL: element['image_small_url_copy'].toString(),
        ),
      );
    }

    return dataAssets;
  } catch (e) {
    throw Exception('ERROR --> ${e.toString()}');
  }
}

List<Widget> createWidgetListFromAssets(List dataAssets, BuildContext context) {
  List<Widget> widgetList = [];

  dataAssets.forEach(
    (element) {
      widgetList.add(
        InkWell(
          child: Container(
            padding: const EdgeInsets.all(8),
            color: kStyleGuideColorOrange,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                  element.nftImageURL.toString(),
                  height: 100,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.amber,
                      alignment: Alignment.center,
                      child: const Text(
                        'Whoops!',
                        style: TextStyle(fontSize: 30),
                      ),
                    );
                  },
                ),
                Text(
                  element.nftName.toString(),
                  style: const TextStyle(fontSize: 10),
                )
              ],
            ),
          ),
          onTap: () async {
            try {
              //call Aspect Service to get NFT's
              print('TAB TAB');
              print(element.nftName.toString());
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DisplayNFTDetailsScreen(
                    imageUrl: element.nftImageURL.toString(),
                    nftName: element.nftName.toString(),
                  ),
                ),
              );

              //Navigator.push(context, route)
            } catch (e) {
              // If an error occurs, log the error to the console.
              print(e);
            }
          },
        ),
      );
    },
  );

  return widgetList;
}
