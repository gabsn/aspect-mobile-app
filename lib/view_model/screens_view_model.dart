/// --------------------------------------------------
/// screens_view_model.dart
///
/// -> all business logic and state related code for all screens loaded through main screen
/// --------------------------------------------------
///
/// Imports ------------------------------------------
///
/// External
import 'package:flutter/material.dart';

/// Model

/// View
import 'package:aspect_mobile_app/view/screens/home/home_screen.dart';
import 'package:aspect_mobile_app/view/screens/nft/nft_collection_screen.dart';

/// Imports ------------------------------------------

class ScreensChangeNotifier extends ChangeNotifier {
  late int _index = 0;
  late List<Widget> _nftAssetList = [];

  final _pages = <Widget>[const HomeScreen(), const NFTCollectionScreen()];

  int get pageIndex {
    return _index;
  }

  List<Widget> get nftAssetList {
    return _nftAssetList;
  }

  Widget activePage(int index) {
    try {
      return _pages[index];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void setIndex({required int index}) {
    try {
      _index = index;
      notifyListeners();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void setNftAssetList({required List<Widget> nftAssetList}) {
    try {
      _nftAssetList = nftAssetList;
      notifyListeners();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
