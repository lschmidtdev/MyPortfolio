import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:responsive_builder/responsive_builder.dart';

enum DisplayType {
  desktop,
  mobile,
  tablet,
}

const _desktopPortraitBreakpoint = 700.0;
const _desktopLandscapeBreakpoint = 1000.0;
const ipadProBreakpoint = 1000.0;

/// Returns the [DisplayType] for the current screen. Only supports
/// mobile and desktop layouts, and as such we only have one breakpoint.
DisplayType displayTypeOf(BuildContext context) {
  final orientation = MediaQuery.of(context).orientation;
  final width = MediaQuery.of(context).size.width;

  if ((orientation == Orientation.landscape &&
          width > _desktopLandscapeBreakpoint) ||
      (orientation == Orientation.portrait &&
          width > _desktopPortraitBreakpoint)) {
    return DisplayType.desktop;
  } else {
    return DisplayType.mobile;
  }
}

bool isDisplayDesktop(BuildContext context) {
  return displayTypeOf(context) == DisplayType.desktop;
}

bool isDisplayMobile(BuildContext context) {
  return MediaQuery.of(context).size.width <= const RefinedBreakpoints().tabletSmall;
}

bool isDisplayMobileOrTablet(BuildContext context) {
  return MediaQuery.of(context).size.width <=
      const RefinedBreakpoints().tabletNormal;
}

bool isDisplaySmallDesktop(BuildContext context) {
  return isDisplayDesktop(context) &&
      MediaQuery.of(context).size.width < _desktopLandscapeBreakpoint;
}

bool isDisplaySmallDesktopOrIpadPro(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  return isDisplaySmallDesktop(context) ||
      (screenWidth > ipadProBreakpoint && screenWidth < 1170);
}

double widthOfScreen(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double heightOfScreen(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double assignHeight(
  BuildContext context,
  double fraction, {
  double additions = 0,
  double subs = 0,
}) {
  return (heightOfScreen(context) - subs + additions) * fraction;
}

double assignWidth(
  BuildContext context,
  double fraction, {
  double additions = 0,
  double subs = 0,
}) {
  return (widthOfScreen(context) - subs + additions) * fraction;
}

double responsiveSize(
  BuildContext context,
  double xs,
  double lg, {
  double? sm,
  double? md,
  double? xl,
}) {
  return context.layout.value(
    xs: xs,
    sm: sm ?? (md ?? xs), // assign md to sm if it is not null, if null assign xs
    md: md ?? lg,
    lg: lg,
    xl: xl ?? lg,
  );
}

int responsiveSizeInt(
  BuildContext context,
  int xs,
  int lg, {
  int? sm,
  int? md,
  int? xl,
}) {
  return context.layout.value(
    xs: xs,
    sm: sm ?? (md ?? xs),
    md: md ?? lg,
    lg: lg,
    xl: xl ?? lg,
  );
}

Color responsiveColor(
  BuildContext context,
  Color xs,
  Color lg, {
  Color? sm,
  Color? md,
  Color? xl,
}) {
  return context.layout.value(
    xs: xs,
    sm: sm ?? (md ?? xs),
    md: md ?? lg,
    lg: lg,
    xl: xl ?? lg,
  );
}

double getSidePadding(BuildContext context) {
  final sidePadding = assignWidth(context, 0.05);
  return responsiveSize(context, 30, sidePadding, md: sidePadding);
}