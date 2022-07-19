/// --------------------------------------------------
/// nft_collection_screen.dart
///
/// -> App landing page
/// -> Shows most recent minted NFT's from Aspect marketplace
/// --------------------------------------------------
///
/// Imports ------------------------------------------
/// External
import 'package:aspect_mobile_app/view/screens/nft/nft_collection_screen_logic.dart';
import 'package:aspect_mobile_app/view/screens/nft/nft_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// View Model
import 'package:aspect_mobile_app/view_model/screens_view_model.dart';

/// View
import 'package:aspect_mobile_app/view/widgets/appbar_widget.dart';

///Model

/// Imports ------------------------------------------

class NFTCollectionScreen extends StatefulWidget {
  const NFTCollectionScreen({Key? key}) : super(key: key);

  @override
  State<NFTCollectionScreen> createState() => _NFTCollectionScreenState();
}

class _NFTCollectionScreenState extends State<NFTCollectionScreen> {
  List _nftAssets = [];

  @override
  void initState() {
    try {
      try {
        Future.delayed(
          Duration.zero,
          () async {
            //Load NFT Assets from Aspect
            WidgetsBinding.instance.addPostFrameCallback(
              (timeStamp) async {
                final screenChangeManagerLocal =
                    Provider.of<ScreensChangeNotifier>(context, listen: false);

                //Load Games List
                _nftAssets = await loadNFTAssetsFromAspectWithWalletAddress(
                    walletAddress:
                        '0x078C10DF71F013F5f2028bc3bFe7013fe5D79F438d603565323bD1914887F746');

                screenChangeManagerLocal.setNftMyAssetList(
                    nftAssetList: createWidgetListFromAssets(_nftAssets));
              },
            );
          },
        );

        super.initState();
      } catch (e) {
        throw Exception(e.toString());
      }

      super.initState();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(context) {
    try {
      return WillPopScope(
        onWillPop: () async => false,
        child: Consumer<ScreensChangeNotifier>(
          builder: (context, screenChangeNotifier, _) {
            return Scaffold(
              appBar: const AppBarWidget(
                title: 'Minted by Me',
              ),
              body: SafeArea(
                child: Center(
                  child: CustomScrollView(
                    primary: false,
                    slivers: <Widget>[
                      SliverPadding(
                        padding: const EdgeInsets.all(20),
                        sliver: SliverGrid.count(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                            children: screenChangeNotifier.nftMyAssetList),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
