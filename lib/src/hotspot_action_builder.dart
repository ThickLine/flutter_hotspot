import 'package:flutter/material.dart';
import 'package:hotspot/src/builder_settings.dart';

import 'hotspot_provider.dart';

class HotspotActionBuilder extends StatelessWidget {
  //* Use [BuilderSettings] for custom trasnlation
  const HotspotActionBuilder(
    this.controller, {
    Key? key,
    this.settings,
  }) : super(key: key);

  final CalloutActionController controller;
  final BuilderSettings? settings;
  final _duration = const Duration(milliseconds: 250);
  final _curve = Curves.easeOutCirc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10) +
          EdgeInsets.symmetric(
            horizontal: 10,
          ),
      child: Row(
        children: [
          /// Back / end tour button
          Opacity(
            opacity: 0.5,
            child: TextButton(
              child: Text(controller.isFirstPage
                  ? settings!.endText
                  : settings!.previousText),
              onPressed: () {
                controller.previous();
              },
            ),
          ),

          /// The number of hotspots indicator. It will auto-scale its size to fit if
          /// it has too many items to fit horizontally.
          Expanded(
            flex: 4,
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
                            ? Colors.white
                            : Colors.white30,
                        borderRadius: BorderRadius.circular(99),
                      ),
                      height: 6,
                      width: 6,
                    ),
                ],
              ),
            ),
          ),

          SizedBox(width: 18),

          /// Next / done button.
          SizedBox(
            width: 82,
            child: ElevatedButton(
              child: Text(controller.isLastPage
                  ? settings!.doneText
                  : settings!.nextText),
              onPressed: () {
                controller.next();
              },
            ),
          ),
        ],
      ),
    );
  }
}
