import 'package:core_module/src/common/common.dart';
import 'package:flutter/material.dart';

mixin SpacedWidgets {
  List<Widget> getChildren(List<Widget?> children) {
    List<Widget> results = <Widget>[];
    List<Widget> widgets = children.compactMap<Widget>().toList();

    if (widgets.isNotEmpty) {
      Widget lastWidget = widgets.last;

      for (Widget element in widgets) {
        results.add(element);

        if (element != lastWidget) {
          results.add(getSpace());
        }
      }
    }

    return results;
  }

  Widget getSpace();
}
