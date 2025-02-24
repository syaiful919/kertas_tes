import 'spaced_widgets.dart';
import 'package:flutter/material.dart';

class SpacedColumn extends StatelessWidget with SpacedWidgets {
  final List<Widget?> children;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final VerticalDirection verticalDirection;
  final double space;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;

  const SpacedColumn({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.verticalDirection = VerticalDirection.down,
    this.space = 0.0,
    this.textDirection,
    this.textBaseline,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = getChildren(children);

    if (widgets.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      verticalDirection: verticalDirection,
      textDirection: textDirection,
      textBaseline: textBaseline,
      children: widgets,
    );
  }

  @override
  Widget getSpace() {
    return SizedBox(
      height: space,
    );
  }
}
