import 'package:flutter/material.dart';
import '../../foundation/tokens.dart';
import 'ds_template_theme.dart';

// Replace all occurrences of "Template"/"template" with your component name.

enum DsTemplateVariant { primary, secondary }
enum DsTemplateSize { sm, md, lg }

class DsTemplate extends StatelessWidget {
  const DsTemplate({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = DsTemplateVariant.primary,
    this.size = DsTemplateSize.md,
  });

  final String label;
  final VoidCallback? onPressed;
  final DsTemplateVariant variant;
  final DsTemplateSize size;

  bool get _isDisabled => onPressed == null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<DsTemplateTheme>() ?? DsTemplateTheme.defaults;

    Widget child = Semantics(
      label: label,
      button: true,
      enabled: !_isDisabled,
      child: Text(label),
    );

    if (_isDisabled) {
      child = IgnorePointer(
        child: Opacity(opacity: theme.disabledOpacity, child: child),
      );
    }

    return child;
  }
}
