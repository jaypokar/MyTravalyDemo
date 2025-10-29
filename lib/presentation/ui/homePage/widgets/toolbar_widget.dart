import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../base/base_stateful_widget.dart';
import '../../../../data/sessionManager/session_manager.dart';
import '../../../../injection_container.dart';
import '../../../../resources/color_constants.dart';
import '../../../../resources/image_resources.dart';
import '../../../../resources/string_resources.dart';
import '../../../basicWidget/textWidgets/text_bold_widget.dart';
import '../../../basicWidget/textWidgets/text_semibold_widget.dart';

final GlobalKey firstShowcaseWidget = GlobalKey();

class ToolbarWidget extends StatefulWidget {
  const ToolbarWidget({
    super.key,
  });

  @override
  State<ToolbarWidget> createState() => _ToolbarWidgetState();
}

class _ToolbarWidgetState extends BaseStatefulWidgetState<ToolbarWidget> {
  @override
  Widget build(BuildContext context) {
    final userName = 'Hello, ${sl<SessionManager>().userName()}';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            final TabsRouter tabsRouter = AutoTabsRouter.of(context);
            tabsRouter.setActiveIndex(3);
          },
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            child: Image.asset(
              ImageResources.appIcon,
              height: 40,
            ),
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () {
            final TabsRouter tabsRouter = AutoTabsRouter.of(context);
            tabsRouter.setActiveIndex(3);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextSemiBoldWidget(
                data: userName,
                textColor: ColorConstants.appColor,
                fontSize: 16,
              ),
              const TextBoldWidget(
                data: StringResources.welcomeToMyTravaly,
                fontSize: 18,
              ),
            ],
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () async {
            //sl<AppRouter>().push(const NotificationsRoute());
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isDarkTheme() ? ColorConstants.darkBackground2 : ColorConstants.lightBackground2,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: isDarkTheme() ? ColorConstants.textColor2 : Colors.black12,
              ),
            ),
            child: Icon(
              Icons.logout,
              color: isDarkTheme() ? ColorConstants.white : ColorConstants.black,
              size: 20,
            ),
          ),
        )
      ],
    );
  }
}
