import 'package:flutter/widgets.dart';

/// Garmisch Design System Easing Curves
///
/// Animation easing curve tokens for smooth transitions.
/// Usage: `GEasing.easeOut` or `GEasing.spring`
abstract final class GEasing {
  GEasing._();

  // ============================================
  // Standard Curves
  // ============================================

  /// Linear - constant speed, no acceleration
  static const Curve linear = Curves.linear;

  /// Ease - slight acceleration and deceleration
  static const Curve ease = Curves.ease;

  /// Ease In - starts slow, accelerates
  static const Curve easeIn = Curves.easeIn;

  /// Ease Out - starts fast, decelerates (most common)
  static const Curve easeOut = Curves.easeOut;

  /// Ease In Out - slow start and end
  static const Curve easeInOut = Curves.easeInOut;

  // ============================================
  // Sine Curves (Gentle)
  // ============================================

  /// Ease In Sine - gentle acceleration
  static const Curve easeInSine = Cubic(0.12, 0, 0.39, 0);

  /// Ease Out Sine - gentle deceleration
  static const Curve easeOutSine = Cubic(0.61, 1, 0.88, 1);

  /// Ease In Out Sine - gentle both ways
  static const Curve easeInOutSine = Cubic(0.37, 0, 0.63, 1);

  // ============================================
  // Quad Curves (Moderate)
  // ============================================

  /// Ease In Quad - moderate acceleration
  static const Curve easeInQuad = Cubic(0.11, 0, 0.5, 0);

  /// Ease Out Quad - moderate deceleration
  static const Curve easeOutQuad = Cubic(0.5, 1, 0.89, 1);

  /// Ease In Out Quad - moderate both ways
  static const Curve easeInOutQuad = Cubic(0.45, 0, 0.55, 1);

  // ============================================
  // Cubic Curves (Strong)
  // ============================================

  /// Ease In Cubic - strong acceleration
  static const Curve easeInCubic = Cubic(0.32, 0, 0.67, 0);

  /// Ease Out Cubic - strong deceleration
  static const Curve easeOutCubic = Cubic(0.33, 1, 0.68, 1);

  /// Ease In Out Cubic - strong both ways
  static const Curve easeInOutCubic = Cubic(0.65, 0, 0.35, 1);

  // ============================================
  // Quart Curves (Very Strong)
  // ============================================

  /// Ease In Quart - very strong acceleration
  static const Curve easeInQuart = Cubic(0.5, 0, 0.75, 0);

  /// Ease Out Quart - very strong deceleration
  static const Curve easeOutQuart = Cubic(0.25, 1, 0.5, 1);

  /// Ease In Out Quart - very strong both ways
  static const Curve easeInOutQuart = Cubic(0.76, 0, 0.24, 1);

  // ============================================
  // Quint Curves (Extreme)
  // ============================================

  /// Ease In Quint - extreme acceleration
  static const Curve easeInQuint = Cubic(0.64, 0, 0.78, 0);

  /// Ease Out Quint - extreme deceleration
  static const Curve easeOutQuint = Cubic(0.22, 1, 0.36, 1);

  /// Ease In Out Quint - extreme both ways
  static const Curve easeInOutQuint = Cubic(0.83, 0, 0.17, 1);

  // ============================================
  // Expo Curves (Exponential)
  // ============================================

  /// Ease In Expo - exponential acceleration
  static const Curve easeInExpo = Cubic(0.7, 0, 0.84, 0);

  /// Ease Out Expo - exponential deceleration
  static const Curve easeOutExpo = Cubic(0.16, 1, 0.3, 1);

  /// Ease In Out Expo - exponential both ways
  static const Curve easeInOutExpo = Cubic(0.87, 0, 0.13, 1);

  // ============================================
  // Circ Curves (Circular)
  // ============================================

  /// Ease In Circ - circular acceleration
  static const Curve easeInCirc = Cubic(0.55, 0, 1, 0.45);

  /// Ease Out Circ - circular deceleration
  static const Curve easeOutCirc = Cubic(0, 0.55, 0.45, 1);

  /// Ease In Out Circ - circular both ways
  static const Curve easeInOutCirc = Cubic(0.85, 0, 0.15, 1);

  // ============================================
  // Back Curves (Overshoot)
  // ============================================

  /// Ease In Back - overshoot at start
  static const Curve easeInBack = Cubic(0.36, 0, 0.66, -0.56);

  /// Ease Out Back - overshoot at end (bouncy feel)
  static const Curve easeOutBack = Cubic(0.34, 1.56, 0.64, 1);

  /// Ease In Out Back - overshoot both ways
  static const Curve easeInOutBack = Cubic(0.68, -0.6, 0.32, 1.6);

  // ============================================
  // Special Curves
  // ============================================

  /// Spring - bouncy spring effect
  static const Curve spring = Cubic(0.175, 0.885, 0.32, 1.275);

  /// Fast Out Slow In - Material Design standard
  static const Curve fastOutSlowIn = Curves.fastOutSlowIn;

  /// Slow Middle - emphasized middle section
  static const Curve slowMiddle = Curves.slowMiddle;

  /// Bounce In - bouncing at start
  static const Curve bounceIn = Curves.bounceIn;

  /// Bounce Out - bouncing at end
  static const Curve bounceOut = Curves.bounceOut;

  /// Bounce In Out - bouncing both ways
  static const Curve bounceInOut = Curves.bounceInOut;

  /// Elastic In - elastic at start
  static const Curve elasticIn = Curves.elasticIn;

  /// Elastic Out - elastic at end
  static const Curve elasticOut = Curves.elasticOut;

  /// Elastic In Out - elastic both ways
  static const Curve elasticInOut = Curves.elasticInOut;

  // ============================================
  // Semantic Curves
  // ============================================

  /// Default animation curve
  static const Curve standard = easeOutCubic;

  /// Emphasized animation (more dramatic)
  static const Curve emphasized = easeInOutCubic;

  /// Enter animation curve (elements appearing)
  static const Curve enter = easeOutCubic;

  /// Exit animation curve (elements disappearing)
  static const Curve exit = easeInCubic;

  /// Container transform curve
  static const Curve container = easeInOutCubic;
}

/// Easing curve enum for type-safe access
enum GEasingToken {
  linear(GEasing.linear),
  ease(GEasing.ease),
  easeIn(GEasing.easeIn),
  easeOut(GEasing.easeOut),
  easeInOut(GEasing.easeInOut),
  easeInSine(GEasing.easeInSine),
  easeOutSine(GEasing.easeOutSine),
  easeInOutSine(GEasing.easeInOutSine),
  easeInQuad(GEasing.easeInQuad),
  easeOutQuad(GEasing.easeOutQuad),
  easeInOutQuad(GEasing.easeInOutQuad),
  easeInCubic(GEasing.easeInCubic),
  easeOutCubic(GEasing.easeOutCubic),
  easeInOutCubic(GEasing.easeInOutCubic),
  easeInBack(GEasing.easeInBack),
  easeOutBack(GEasing.easeOutBack),
  easeInOutBack(GEasing.easeInOutBack),
  spring(GEasing.spring);

  const GEasingToken(this.curve);

  /// The Curve value
  final Curve curve;
}

