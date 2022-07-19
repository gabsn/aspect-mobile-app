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
          builder: (context, screenChangeNotifier, _) {
            return Scaffold(
              appBar: const AppBarWidget(
                title: 'Latest Aspect NFT\'s',
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
                          children: <Widget>[
                            InkWell(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                color: Colors.green[100],
                                child: const Text(
                                    "He'd have you all unravel at the"),
                              ),
                              onTap: () async {
                                try {
                                  //call Aspect Service to get NFT's
                                  final NFTAssets =
                                      await getIt<AspectAPIService>()
                                          .getAspectAssets(limit: 10);

                                  print(NFTAssets.toString());
                                } catch (e) {
                                  // If an error occurs, log the error to the console.
                                  print(e);
                                }
                              },
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              color: Colors.green[200],
                              child: const Text('Heed not the rabble'),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              color: Colors.green[300],
                              child: const Text('Sound of screams but the'),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              color: Colors.green[400],
                              child: const Text('Who scream'),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              color: Colors.green[500],
                              child: const Text('Revolution is coming...'),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              color: Colors.green[600],
                              child: const Text('Revolution, they...'),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              color: Colors.green[600],
                              child: const Text('Revolution, they...'),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              color: Colors.green[600],
                              child: const Text('Revolution, they...'),
                            ),
                          ],
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
