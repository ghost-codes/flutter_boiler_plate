import 'package:Appapp/redesign/ui/theme/App_color.dart';
import 'package:Appapp/redesign/ui/widgets/buttons/App_button.dart';
import 'package:flutter/material.dart';

class AppSecondaryButton extends StatelessWidget {
  const AppSecondaryButton(
    this.text, {
    super.key,
    this.onPressed,
    this.loading = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text,
      onPressed: onPressed,
      loading: loading,
      foregroundColor: AppColors.black,
      backgroundColor: AppColors.gray.shade200,
    );
  }
}
