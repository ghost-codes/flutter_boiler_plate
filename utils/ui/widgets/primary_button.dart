import 'package:App_ui/App_ui.dart';
import 'package:Appapp/ui/widgets/buttons/base_button.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.color = AppColors.green,
    this.disabled = false,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final bool disabled;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onPressed: onPressed,
      label: label,
      backgroundColor: disabled ? AppColors.grey2.withOpacity(0.8) : color,
      labelColor: AppColors.white,
    );
  }
}

class OutlinedWashButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Color? borderColor;
  final Color? textColor;

  const OutlinedWashButton({
    this.onPressed,
    required this.label,
    this.borderColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    const color = Color(0xffD6D6D6);

    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(color: onPressed != null ? (borderColor ?? AppColors.green) : color),
          ),
        ),
        child: Text(
          label,
          style: themeData.textTheme.subtitle1!.copyWith(
            fontWeight: AppFontWeight.regular,
            color: onPressed == null ? color : (textColor ?? AppColors.green),
          ),
        ),
      ),
    );
  }
}
