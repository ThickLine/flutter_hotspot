import 'package:flutter/material.dart';
import 'package:hotspot/src/builder_settings.dart';
import 'package:hotspot/src/helper/color_extension.dart';

import 'hotspot_provider.dart';
typedef TourCompletedCallback = void Function();
class HotspotActionBuilder extends StatelessWidget {
  final TourCompletedCallback? onTourCompleted;
  //* Use [BuilderSettings] for custom trasnlation
  const HotspotActionBuilder(
    this.controller, {
    Key? key,
    this.settings,
    this.onTourCompleted,
  }) : super(key: key);

  final CalloutActionController controller;
  final BuilderSettings? settings;
  final _duration = const Duration(milliseconds: 250);
  final _curve = Curves.easeOutCirc;

  @override
  Widget build(BuildContext context) {
    // Get HotspotProvider state color
    final bgColor = HotspotProvider.of(context).widget.color;
    return Padding(
      padding: EdgeInsets.only(bottom: 10) +
          EdgeInsets.symmetric(
            horizontal: 10,
          ),
      child: Row(
        children: [
          /// Back / end tour button
          Opacity(
            opacity: 0.8,
            child: TextButton(
              child: Text(
                  controller.isFirstPage
                      ? settings?.endText ?? 'End tour'
                      : settings?.previousText ?? 'Previous',
                  style: TextStyle().copyWith(color: bgColor.cv)),
              onPressed: () {
                if (controller.isFirstPage && onTourCompleted != null) {
                  onTourCompleted!();
                }
                controller.previous();
              },
            ),
          ),

          /// The number of hotspots indicator. It will auto-scale its size to fit if
          /// it has too many items to fit horizontally.
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                children: [
                  for (var i = 0; i < controller.pages; i++)
                    AnimatedContainer(
                      margin: EdgeInsets.all(3),
                      duration: _duration,
                      curve: _curve,
                      decoration: BoxDecoration(
                        color: controller.index == i
                            ? settings?.primaryColor.withOpacity(0.2) ??
                                Colors.white
                            : settings?.primaryColor ?? Colors.white30,
                        borderRadius: BorderRadius.circular(99),
                      ),
                      height: 6,
                      width: 6,
                    ),
                ],
              ),
            ),
          ),

          /// Next / done button.
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: settings?.primaryColor ?? Colors.blue),
            child: Text(
                controller.isLastPage
                    ? settings?.doneText ?? 'Done'
                    : settings?.nextText ?? 'Next',
                style: TextStyle().copyWith(color: settings?.primaryColor.cv)),
            onPressed: () {
              controller.next();
              if (controller.isLastPage && onTourCompleted != null) {
                onTourCompleted!();
              }
            },
          ),
        ],
      ),
    );
  }
}
