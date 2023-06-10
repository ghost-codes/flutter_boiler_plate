import 'package:Appapp/redesign/ui/theme/App_color.dart';
import 'package:Appapp/redesign/ui/widgets/buttons/App_button.dart';
import 'package:flutter/material.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton(
    this.text, {
    super.key,
    this.onPressed,
    this.loading = false,
    this.color,
    this.textColor,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool loading;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text,
      onPressed: onPressed,
      loading: loading,
      foregroundColor: onPressed == null ? AppColors.gray.shade600 : textColor ?? AppColors.white,
      backgroundColor: color ?? AppColors.primary.shade900,
    );
  }
}
