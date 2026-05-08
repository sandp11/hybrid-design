import 'package:flutter/material.dart';
import '../ds_button_theme.dart';
import 'acko_button_layout.dart';

class DsButton extends StatefulWidget {
  const DsButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = DsButtonVariant.primary,
    this.size = DsButtonSize.md,
    this.isLoading = false,
    this.iconLeft,
    this.iconRight,
    this.iconOnly = false,
    this.fullWidth = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final DsButtonVariant variant;
  final DsButtonSize size;
  final bool isLoading;
  final Widget? iconLeft;
  final Widget? iconRight;
  final bool iconOnly;
  final bool fullWidth;

  bool get isDisabled => onPressed == null || isLoading;

  @override
  State<DsButton> createState() => DsButtonState();
}
