import 'package:flutter/material.dart';

import 'hotspot_target.dart';

extension WithHotspotX on Widget {
  /// Wrap this widget with a branded [HotspotTarget]
  /// Use [BuilderSettings] in [HotspotProvider] for custom trasnlation options
  Widget withHotspot({
    String flow = 'main',
    required num order,
    required Widget title,
    required Widget body,
    double? titleBodySpace,
    Widget? icon,
    Size? hotspotSize,
    Offset hotspotOffset = Offset.zero,
  }) {
    return Builder(
      builder: (context) {
        return HotspotTarget(
          flow: flow,
          hotspotSize: hotspotSize,
          hotspotOffset: hotspotOffset,
          calloutBody: Row(
            children: [
              if (icon != null) ...[
                IconTheme(
                  data: IconThemeData(color: Colors.white),
                  child: icon,
                ),
                SizedBox(width: 16),
              ],
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    title,
                    SizedBox(
                      height: titleBodySpace ?? 12,
                    ),
                    body
                  ],
                ),
              ),
            ],
          ),
          order: order,
          child: this,
        );
      },
    );
  }
}
