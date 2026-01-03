import 'package:flutter/material.dart';

import '../../foundations/foundations.dart';

/// Extension methods for Widget
extension GWidgetExtensions on Widget {
  /// Add padding to all sides
  Widget padding(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  /// Add symmetric padding
  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  /// Add padding to specific sides
  Widget paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
      child: this,
    );
  }

  /// Add horizontal padding
  Widget paddingHorizontal(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value),
      child: this,
    );
  }

  /// Add vertical padding
  Widget paddingVertical(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: value),
      child: this,
    );
  }

  /// Add margin using Container
  Widget margin(double value) {
    return Container(
      margin: EdgeInsets.all(value),
      child: this,
    );
  }

  /// Center the widget
  Widget centered() {
    return Center(child: this);
  }

  /// Wrap with Expanded
  Widget expanded({int flex = 1}) {
    return Expanded(flex: flex, child: this);
  }

  /// Wrap with Flexible
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) {
    return Flexible(flex: flex, fit: fit, child: this);
  }

  /// Add opacity
  Widget opacity(double value) {
    return Opacity(opacity: value, child: this);
  }

  /// Conditional visibility
  Widget visible(bool condition) {
    return Visibility(visible: condition, child: this);
  }

  /// Add aspect ratio
  Widget aspectRatio(double ratio) {
    return AspectRatio(aspectRatio: ratio, child: this);
  }

  /// Clip with rounded corners
  Widget clipRRect({double radius = GBorderRadius.md}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: this,
    );
  }

  /// Add tap handler
  Widget onTap(VoidCallback? callback) {
    return GestureDetector(onTap: callback, child: this);
  }

  /// Add tooltip
  Widget withTooltip(String message) {
    return Tooltip(message: message, child: this);
  }

  /// Wrap with SafeArea
  Widget safeArea({
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
  }) {
    return SafeArea(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: this,
    );
  }

  /// Add background color
  Widget background(Color color) {
    return Container(
      color: color,
      child: this,
    );
  }

  /// Add decoration
  Widget decorated(BoxDecoration decoration) {
    return Container(
      decoration: decoration,
      child: this,
    );
  }

  /// Constrain size
  Widget constrained({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minWidth ?? 0,
        maxWidth: maxWidth ?? double.infinity,
        minHeight: minHeight ?? 0,
        maxHeight: maxHeight ?? double.infinity,
      ),
      child: this,
    );
  }

  /// Set fixed size
  Widget sized({double? width, double? height}) {
    return SizedBox(width: width, height: height, child: this);
  }

  /// Align widget
  Widget align(Alignment alignment) {
    return Align(alignment: alignment, child: this);
  }

  /// Make scrollable
  Widget scrollable({
    Axis direction = Axis.vertical,
    EdgeInsets? padding,
  }) {
    return SingleChildScrollView(
      scrollDirection: direction,
      padding: padding,
      child: this,
    );
  }
}

