import 'package:flutter/widgets.dart';

import '../../foundations/foundations.dart';

/// Extension methods for num (int and double)
extension GNumExtensions on num {
  /// Create a SizedBox with this width
  SizedBox get horizontalSpace => SizedBox(width: toDouble());

  /// Create a SizedBox with this height
  SizedBox get verticalSpace => SizedBox(height: toDouble());

  /// Create EdgeInsets with this value on all sides
  EdgeInsets get allInsets => EdgeInsets.all(toDouble());

  /// Create horizontal EdgeInsets
  EdgeInsets get horizontalInsets =>
      EdgeInsets.symmetric(horizontal: toDouble());

  /// Create vertical EdgeInsets
  EdgeInsets get verticalInsets => EdgeInsets.symmetric(vertical: toDouble());

  /// Create BorderRadius with this value
  BorderRadius get borderRadius => BorderRadius.circular(toDouble());

  /// Create a Duration in milliseconds
  Duration get ms => Duration(milliseconds: toInt());

  /// Create a Duration in seconds
  Duration get seconds => Duration(seconds: toInt());

  /// Create a Duration in minutes
  Duration get minutes => Duration(minutes: toInt());
}

/// Extension methods for Duration
extension GDurationExtensions on Duration {
  /// Check if this is a fast duration (< 200ms)
  bool get isFast => inMilliseconds < 200;

  /// Check if this is a normal duration (200-400ms)
  bool get isNormal => inMilliseconds >= 200 && inMilliseconds <= 400;

  /// Check if this is a slow duration (> 400ms)
  bool get isSlow => inMilliseconds > 400;
}

/// Extension methods for EdgeInsets
extension GEdgeInsetsExtensions on EdgeInsets {
  /// Add padding to all sides
  EdgeInsets operator +(EdgeInsets other) {
    return EdgeInsets.only(
      left: left + other.left,
      top: top + other.top,
      right: right + other.right,
      bottom: bottom + other.bottom,
    );
  }

  /// Multiply all padding values
  EdgeInsets operator *(double factor) {
    return EdgeInsets.only(
      left: left * factor,
      top: top * factor,
      right: right * factor,
      bottom: bottom * factor,
    );
  }
}

/// Spacing helper class
class Spacing {
  Spacing._();

  /// Extra small spacing (8px)
  static const double xs = GSpacing.xs;

  /// Small spacing (12px)
  static const double sm = GSpacing.sm;

  /// Medium spacing (16px)
  static const double md = GSpacing.md;

  /// Large spacing (20px)
  static const double lg = GSpacing.lg;

  /// Extra large spacing (24px)
  static const double xl = GSpacing.xl;
}

