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

/// Imports ------------------------------------------

Future<List> loadNFTAssetsFromAspectWithWalletAddress(
    {int limit = 10, required String walletAddress}) async {
  try {
    final dataAssets = [];

    final response = await getIt<AspectAPIService>()
        .getAspectAssetsByWalletAddress(
            limit: limit, walletAddress: walletAddress);

    final List nftAssets = response[0]['assets'];

    //Convert Assets to Data Objects
    for (var element in nftAssets) {
      dataAssets.add(
        NFTMetadata(
          nftName: element['name'].toString(),
          nftCollectionName: '',
          nftOwnerAccountAddress:
              element['owner']['account_address'].toString(),
          nftDescription: element['description'].toString(),
          nftImageURL: element['image_url_copy'].toString(),
        ),
      );
    }

    return dataAssets;
  } catch (e) {
    throw Exception('ERROR --> ${e.toString()}');
  }
}

List<Widget> createWidgetListFromAssets(List dataAssets) {
  List<Widget> widgetList = [];

  for (var element in dataAssets) {
    widgetList.add(
      InkWell(
        child: Container(
          padding: const EdgeInsets.all(8),
          color: kStyleGuideColorOrange,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              element.nftImageURL.toString() == 'null'
                  ? const Image(
                      image: AssetImage('images/starknet_logo_small.png'),
                      width: 100,
                      height: 100,
                    )
                  : Image.network(
                      element.nftImageURL.toString(),
                      height: 100,
                    ),
              Text(
                element.nftOwnerAccountAddress.toString(),
                style: const TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
        onTap: () async {
          try {
            //call Aspect Service to get NFT's

          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
      ),
    );
  }

  return widgetList;
}
