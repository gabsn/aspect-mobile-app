/// --------------------------------------------------
/// home_screen.dart
///
/// -> App landing page
/// -> Shows most recent minted NFT's from Aspect marketplace
/// --------------------------------------------------
///
/// Imports ------------------------------------------
/// External
import 'package:aspect_mobile_app/model/services/aspect_api_services/aspect_api_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// View Model
import 'package:aspect_mobile_app/view_model/screens_view_model.dart';

/// View
import 'package:aspect_mobile_app/view/widgets/appbar_widget.dart';
import '../../../view_model/screens_view_model.dart';
import 'home_screen_logic.dart';

///Model
import 'package:aspect_mobile_app/model/services/service_locator.dart';

///Model

/// Imports ------------------------------------------

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _nftAssets = [];

  @override
  void initState() {
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
              _nftAssets = await loadNFTAssetsFromAspect();

              screenChangeManagerLocal.setNftAssetList(
                  nftAssetList: createWidgetListFromAssets(_nftAssets));
            },
          );
        },
      );

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
                title: 'Latest 10 Aspect NFT\'s',
              ),
              body: SafeArea(
                child: Center(
                  child: CustomScrollView(
                    primary: false,
                    slivers: <Widget>[
                      SliverPadding(
                        padding: EdgeInsets.all(20),
                        sliver: SliverGrid.count(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                          children: screenChangeNotifier.nftAssetList,
                        ),
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

/*

 */
