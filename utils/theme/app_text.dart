import 'package:flutter/material.dart';
import 'package:loyalty/utils/theme/App_typography.dart';
import 'package:loyalty/utils/theme/colors.dart';

class AppText {
  /// bold text
  static Text h1Bold(String text, {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: SelisTypography.h1Bold(textColor: textColor));

  static Text h2Bold(String text, {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: SelisTypography.h2Bold(textColor: textColor));

  static Text h3Bold(String text, {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: SelisTypography.h3Bold(textColor: textColor));

  static Text h4Bold(String text, {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: SelisTypography.h4Bold(textColor: textColor));

  static Text h5Bold(String text, {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: SelisTypography.h5Bold(textColor: textColor));

  static Text h6Bold(String text, {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: SelisTypography.h6Bold(textColor: textColor));

  static Text paragraphBold(String text,
          {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: SelisTypography.paragraphBold(textColor: textColor));

  static Text descriptionBold(String text,
          {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text,
          textAlign: textAlign, style: SelisTypography.descriptionBold(textColor: textColor));

  static Text captionBold(String text,
          {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: SelisTypography.captionBold(textColor: textColor));

  static Text subHeadingBold(String text,
          {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: SelisTypography.subHeadingBold(textColor: textColor));

  static Text xsmBold(String text, {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: SelisTypography.xsmBold(textColor: textColor));

  /// medium text
  static Text h1Medium(String text, {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: SelisTypography.h1Medium(textColor: textColor));

  static Text h2Medium(String text, {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: SelisTypography.h2Medium(textColor: textColor));

  static Text h3Medium(String text,
          {Color? textColor = SelisColors.black, TextAlign? textAlign, TextOverflow? overflow}) =>
      Text(text,
          textAlign: textAlign,
          overflow: overflow,
          style: SelisTypography.h3Medium(textColor: textColor));

  static Text h4Medium(String text, {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: SelisTypography.h4Medium(textColor: textColor));

  static Text h5Medium(String text, {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: SelisTypography.h5Medium(textColor: textColor));

  static Text h6Medium(String text, {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: SelisTypography.h6Medium(textColor: textColor));

  static Text paragraphMedium(String text,
          {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text,
          textAlign: textAlign, style: SelisTypography.paragraphMedium(textColor: textColor));

  static Text descriptionMedium(String text,
          {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text,
          textAlign: textAlign, style: SelisTypography.descriptionMedium(textColor: textColor));

  static Text captionMedium(String text,
          {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: SelisTypography.captionMedium(textColor: textColor));

  static Text subHeadingMedium(String text,
          {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text,
          textAlign: textAlign, style: SelisTypography.subHeadingMedium(textColor: textColor));

  static Text xsmMedium(String text,
          {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: SelisTypography.xsmMedium(textColor: textColor));

  /// regular text
  static Text h1Regular(String text,
          {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: SelisTypography.h1Regular(textColor: textColor));

  static Text h2Regular(String text,
          {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: SelisTypography.h2Regular(textColor: textColor));

  static Text h3Regular(String text,
          {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: SelisTypography.h3Regular(textColor: textColor));

  static Text h4Regular(String text,
          {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: SelisTypography.h4Regular(textColor: textColor));

  static Text h5Regular(String text,
          {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: SelisTypography.h5Regular(textColor: textColor));

  static Text h6Regular(String text,
          {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: SelisTypography.h6Regular(textColor: textColor));

  static Text paragraphRegular(String text,
          {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text,
          textAlign: textAlign, style: SelisTypography.paragraphRegular(textColor: textColor));

  static Text descriptionRegular(String text,
          {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text,
          textAlign: textAlign, style: SelisTypography.descriptionRegular(textColor: textColor));

  static Text captionRegular(String text,
          {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: SelisTypography.captionRegular(textColor: textColor));

  static Text subHeadingRegular(String text,
          {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text,
          textAlign: textAlign, style: SelisTypography.subHeadingRegular(textColor: textColor));

  static Text xsmRegular(String text,
          {Color? textColor = SelisColors.black, TextAlign? textAlign}) =>
      Text(text, textAlign: textAlign, style: SelisTypography.xsmRegular(textColor: textColor));
}
