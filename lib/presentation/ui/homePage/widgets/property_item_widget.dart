import 'package:flutter/material.dart';
import 'package:mytravaly/data/model/property_list_model.dart';
import 'package:mytravaly/presentation/basicWidget/textWidgets/text_semibold_widget.dart';
import 'package:mytravaly/presentation/commonWidgets/material_touch_bg.dart';
import 'package:mytravaly/resources/color_constants.dart';
import 'package:mytravaly/resources/image_resources.dart';

import '../../../../util/constants.dart';
import '../../../basicWidget/textWidgets/text_thin_widget.dart';

class PropertyItemWidget extends StatelessWidget {
  final Property property;

  const PropertyItemWidget({required this.property, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialTouchBg(
        borderRadius: 15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(15),
              child: Image.network(
                property.propertyImage ?? '',
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    ImageResources.appIcon,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: TextSemiBoldWidget(
                    data: property.propertyName ?? '-',
                    fontSize: 18,
                    textAlign: TextAlign.start,
                  )),
                  TextSemiBoldWidget(
                    data: '$rupee${property.markedPrice?.amount}/-',
                    fontSize: 18,
                    textColor: ColorConstants.appColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: TextThinWidget(
                data: property.propertyAddress?.city ?? '',
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ));
  }
}
