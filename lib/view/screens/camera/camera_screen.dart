/// --------------------------------------------------
/// camera_screen.dart
///
/// -> Load Device Camera and take a picture
/// --------------------------------------------------
///
/// Imports ------------------------------------------
/// External
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// View Model
import 'package:aspect_mobile_app/view_model/screens_view_model.dart';

/// View

///Model
import 'package:aspect_mobile_app/model/constants/constants.dart';

/// Imports ------------------------------------------

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
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
            return Container(
              color: Colors.black87,
              child: Container(
                decoration: kAddGameModalBoxDecoration.copyWith(
                    color: kStyleGuideColorGreen),
                padding: const EdgeInsets.only(
                    top: 30.0, left: 30.0, right: 30.0, bottom: 30.0),
                child: const Center(
                  child: Text('Hello World'),
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
