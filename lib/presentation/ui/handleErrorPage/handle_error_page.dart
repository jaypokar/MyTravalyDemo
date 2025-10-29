import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mytravaly/resources/string_resources.dart';

import '../../../base/base_stateless_widget.dart';
import '../../../injection_container.dart';
import '../../../resources/app_router.dart';
import '../../../resources/image_resources.dart';
import '../../../resources/value_key_resources.dart';
import '../../basicWidget/custom_button.dart';
import '../../basicWidget/textWidgets/text_semibold_widget.dart';

@RoutePage()
class HandleErrorPage extends BaseStatelessWidgetState {
  final int errorCode;

  const HandleErrorPage({required this.errorCode, super.key});

  @override
  Widget build(BuildContext context) {
    final String image = errorCode == ValueKeyResources.noInternetErrorCode
        ? ImageResources.noInternetImg
        : ImageResources.connectionTimeOutImg;
    final String title = errorCode == ValueKeyResources.noInternetErrorCode
        ? StringResources.checkInternetConnection
        : StringResources.connectionTimedOut;

    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image.asset(image, width: MediaQuery.of(context).size.width, height: 280),
            const SizedBox(height: 20),
            TextSemiBoldWidget(fontSize: 16, data: title),
            const SizedBox(height: 20),
            ButtonWidget(
              buttonText: StringResources.tryAgain,
              isWrap: true,
              onPressButton: () async {
                final bool hasConnection = await sl<InternetConnection>().hasInternetAccess;
                if (hasConnection) {
                  sl<AppRouter>().removeWhere((RouteData route) => route.name == HandleErrorRoute.name);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void showProgress(BuildContext context) {
    // TODO: implement showProgress
  }
}
