/// --------------------------------------------------
/// main_screen.dart
///
/// -> App screens container including:
///    -> App body
///    -> Bottom Navigation
/// --------------------------------------------------
///
/// Imports ------------------------------------------
///External

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Model
import 'package:aspect_mobile_app/model/constants/constants.dart';

/// View
import 'package:aspect_mobile_app/view/widgets/tabbar_material_widget.dart';
import 'package:aspect_mobile_app/view/screens/camera/camera_screen.dart';

///View Model
import 'package:aspect_mobile_app/view_model/screens_view_model.dart';

/// Imports ------------------------------------------

class MainScreen extends StatelessWidget {
  static const String id = 'main_screen';
  final String title;

  const MainScreen({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    try {
      return Consumer<ScreensChangeNotifier>(
        builder: (context, screenChange, child) {
          return Scaffold(
            extendBody: true,
            body: screenChange.activePage(screenChange.pageIndex),
            bottomNavigationBar: TabBarMaterialWidget(
              index: screenChange.pageIndex,
              onChangedTab: (index) => screenChange.setIndex(index: index),
              key: UniqueKey(), //onChangedTabLocal,
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.camera),
              backgroundColor: kStyleGuideColorGreen,
              disabledElevation: 10.0,
              onPressed: () async {
                var retval = await showModalBottomSheet(
                  context: context,
                  builder: (context) => const CameraScreen(),
                  isScrollControlled: true,
                  enableDrag: true,
                );

                if (retval == 'reset') {
                  //Do something
                }
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
        },
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
