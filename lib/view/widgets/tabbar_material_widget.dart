/// --------------------------------------------------
/// tabbar_material_widget.dart
///
/// -> Bottom Navigation Tab Bar
/// --------------------------------------------------
///
/// Imports ------------------------------------------
/// External
import 'package:flutter/material.dart';

/// Model
import 'package:aspect_mobile_app/model/constants/constants.dart';

/// Imports ------------------------------------------

class TabBarMaterialWidget extends StatelessWidget {
  final int index;
  final ValueChanged<int> onChangedTab;

  const TabBarMaterialWidget({
    required this.index,
    required this.onChangedTab,
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      const placeholder = Opacity(
        opacity: 0,
        child: IconButton(icon: Icon(Icons.no_cell), onPressed: null),
      );

      return BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildTabItem(
              index: 0,
              icon: kNavigationIconHome,
            ),
            placeholder,
            placeholder,
            buildTabItem(
              index: 1,
              icon: kNavigationIconStatistics,
            )

            /*       buildTabItem(
              index: 2,
              icon: kNavigationIconGames,
            ),
            buildTabItem(
              index: 3,
              icon: kNavigationIconProfile,
            )*/
            ,
          ],
        ),
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Widget buildTabItem({
    required int index,
    required Icon icon,
  }) {
    try {
      final isSelected = index == this.index;

      return IconTheme(
        data: IconThemeData(
          color: isSelected ? kStyleGuideColorOrange : kStyleGuideColorWhite,
        ),
        child: IconButton(
          icon: icon,
          onPressed: () => this.onChangedTab(index),
        ),
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
