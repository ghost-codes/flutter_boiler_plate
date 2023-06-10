import 'package:flutter/material.dart';
import 'package:loyalty/utils/theme/colors.dart';

final theme = ThemeData(
  primaryColor: SelisColors.primary,
  colorScheme: ColorScheme.fromSeed(seedColor: SelisColors.primary),
  textTheme: const TextTheme().apply(fontFamily: "Satoshi"),
);
