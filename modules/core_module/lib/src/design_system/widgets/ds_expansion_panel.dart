import 'package:core_module/core_module.dart';
import 'package:flutter/cupertino.dart';

class DSExpansionPanel extends StatefulWidget {
  final Widget child;
  final bool expandAtInit;
  final String title;

  const DSExpansionPanel({
    super.key,
    required this.child,
    required this.title,
    this.expandAtInit = false,
  });

  @override
  State<DSExpansionPanel> createState() => _DSExpansionPanelState();
}

class _DSExpansionPanelState extends State<DSExpansionPanel> {
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.expandAtInit;
  }

  @override
  Widget build(BuildContext context) {
    return DSFlatCard(
      child: SpacedColumn(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _getHeader(),
          _getContent(),
        ],
      ),
    );
  }

  Widget _getHeader() {
    return GestureDetector(
      onTap: _toggleExpansion,
      child: SpacedRow(
        space: Gap.sm,
        children: [
          Expanded(
            child: Text(
              widget.title,
              style: const TextStyle(
                color: AppColors.grey600,
                fontSize: FontSize.lg,
                height: 1.25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(
            _isExpanded
                ? CupertinoIcons.chevron_down
                : CupertinoIcons.chevron_up,
            color: AppColors.grey600,
            size: FontSize.xxl,
          ),
        ],
      ),
    );
  }

  Widget? _getContent() {
    if (_isExpanded) {
      return null;
    }

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.grey100),
        ),
      ),
      padding: const EdgeInsets.only(top: Gap.md),
      margin: const EdgeInsets.only(top: Gap.md),
      child: widget.child,
    );
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }
}
