import 'spaced_widgets.dart';
import 'package:flutter/material.dart';

class SpacedRow extends StatelessWidget with SpacedWidgets {
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final VerticalDirection verticalDirection;
  final List<Widget?> children;
  final double space;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;

  const SpacedRow({
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

    if (children.isEmpty) {
      return const SizedBox.shrink();
    }

    return Row(
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
      width: space,
    );
  }
}
