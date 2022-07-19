/// --------------------------------------------------
/// appbar_widget.dart
///
/// -> custom App Bar
/// --------------------------------------------------
///
/// Imports ------------------------------------------
/// External
import 'package:flutter/material.dart';

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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16),
              ),
              const Image(
                image: AssetImage('images/starknet_logo_small.png'),
                width: 40,
                height: 40,
              ),
            ],
          ),
          automaticallyImplyLeading: false,
        ),
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
