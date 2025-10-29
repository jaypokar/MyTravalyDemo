import 'package:flutter/material.dart';
import 'package:mytravaly/base/base_stateless_widget.dart';
import 'package:mytravaly/presentation/basicWidget/textWidgets/text_thin_widget.dart';
import 'package:mytravaly/presentation/commonWidgets/material_touch_bg.dart';

class SearchWidget extends BaseStatelessWidgetState {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialTouchBg(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(Icons.search, color: isDarkTheme(context) ? Colors.white54 : Colors.black45),
            const SizedBox(width: 10),
            TextThinWidget(
              data: 'Search Hotels...',
              fontSize: 16,
              color: isDarkTheme(context) ? Colors.white54 : Colors.black45,
            ),
          ],
        ));
  }
}
