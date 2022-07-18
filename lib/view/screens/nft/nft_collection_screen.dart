/// --------------------------------------------------
/// nft_collection_screen.dart
///
/// -> App landing page
/// -> Shows most recent minted NFT's from Aspect marketplace
/// --------------------------------------------------
///
/// Imports ------------------------------------------
/// External
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// View Model
import 'package:aspect_mobile_app/view_model/screens_view_model.dart';

/// View
import 'package:aspect_mobile_app/view/screens/home/home_screen.dart';

import 'package:aspect_mobile_app/view/widgets/appbar_widget.dart';

///Model

/// Imports ------------------------------------------

class NFTCollectionScreen extends StatefulWidget {
  const NFTCollectionScreen({Key? key}) : super(key: key);

  @override
  State<NFTCollectionScreen> createState() => _NFTCollectionScreenState();
}

class _NFTCollectionScreenState extends State<NFTCollectionScreen> {
  @override
  void initState() {
    try {
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
          builder: (context, gameDataManager, _) {
            return Scaffold(
              appBar: const AppBarWidget(
                title: 'Home',
              ),
              body: SafeArea(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Hello'),
                  Text('World'),
                ],
              )
                  //LoadDataStatisticsScreenWidget(),
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
