import 'package:Appapp/redesign/ui/theme/App_color.dart';
import 'package:Appapp/redesign/ui/theme/App_text.dart';
import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton(
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
    final foregroundColor =
        onPressed == null ? AppColors.gray.shade600 : textColor ?? AppColors.primary;
    final backgroundColor = color ?? Theme.of(context).scaffoldBackgroundColor;
    return SizedBox(
      height: 49,
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: foregroundColor,
          disabledForegroundColor: AppColors.gray.shade200,
          backgroundColor: backgroundColor,
          disabledBackgroundColor: AppColors.gray.shade400,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), side: BorderSide(color: AppColors.primary)),
        ),
        child: loading
            ? SizedBox(
                width: 31,
                height: 31,
                child: CircularProgressIndicator(
                  color:
                      onPressed == null ? AppColors.gray.shade600 : textColor ?? AppColors.primary,
                  backgroundColor: AppColors.black.withOpacity(.2),
                ))
            : AppText.paragraphMedium(text, textColor: foregroundColor),
      ),
    );
  }
}
