import 'package:flutter/material.dart';

import 'hotspot_target.dart';

extension WithHotspotX on Widget {
  /// Wrap this widget with a branded [HotspotTarget]
  Widget withHotspot({
    String flow = 'main',
    required num order,
    required String title,
    required String body,
    TextStyle? titleTextStyle,
    TextStyle? bodyTextStyle,
    Widget? icon,
    Size? hotspotSize,
    Offset hotspotOffset = Offset.zero,
  }) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);

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
                    if (title.isNotEmpty)
                      Text(
                        title,
                        style: titleTextStyle ??
                            theme.textTheme.subtitle1!
                                .copyWith(fontWeight: FontWeight.w600),
                      ),
                    if (title.isNotEmpty && body.isNotEmpty)
                      SizedBox(
                        height: 12,
                      ),
                    if (body.isNotEmpty)
                      Text(
                        body,
                        style: bodyTextStyle ?? theme.textTheme.bodyText2,
                      ),
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
