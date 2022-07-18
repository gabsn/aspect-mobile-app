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
import 'package:aspect_mobile_app/view/screens/home/home_screen.dart';

import 'package:aspect_mobile_app/view/widgets/appbar_widget.dart';

import '../../../model/constants/constants.dart';

///Model

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
            return SafeArea(
              child: Scaffold(
                body: Stack(
                  children: <Widget>[
                    const SizedBox(height: 10.0),
                    Container(
                      color: Colors.black87,
                      child: Container(
                        decoration: kAddGameModalBoxDecoration.copyWith(
                            color: Colors.green), //kStyleGuideColorDarkGrey),
                        padding: EdgeInsets.only(
                            top: 30.0, left: 100.0, right: 30.0, bottom: 30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Hello'),
                            Text('World'),
                          ],
                        ),
                      ),
                    )
                  ],
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
