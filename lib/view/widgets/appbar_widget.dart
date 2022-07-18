/// --------------------------------------------------
/// appbar_widget.dart
///
/// -> custom App Bar
/// --------------------------------------------------
///
/// Imports ------------------------------------------
/// External
import 'package:flutter/material.dart';

/// Model

/// View

/// Imports ------------------------------------------
///
class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const AppBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          automaticallyImplyLeading: false,
/*          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.sailing),
              color: kStyleGuideColorWhite,
              iconSize: 20,
            )
          ],*/
        ),
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
