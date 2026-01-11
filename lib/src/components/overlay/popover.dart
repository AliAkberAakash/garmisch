import 'package:flutter/material.dart';

import '../../foundations/border_radius.dart';
import '../../foundations/durations.dart';
import '../../foundations/easing.dart';
import '../../theme/theme.dart';

/// Popover position relative to anchor
enum GPopoverPosition {
  /// Above the anchor
  top,

  /// Below the anchor
  bottom,

  /// Left of the anchor
  left,

  /// Right of the anchor
  right,
}

/// A popover component for the Garmisch design system.
///
/// Displays rich popup content anchored to a trigger widget.
///
/// ```dart
/// GPopover(
///   content: (close) => Padding(
///     padding: EdgeInsets.all(16),
///     child: Column(
///       mainAxisSize: MainAxisSize.min,
///       children: [
///         Text('Popover Content'),
///         ElevatedButton(onPressed: close, child: Text('Close')),
///       ],
///     ),
///   ),
///   child: Text('Tap me'),
/// )
/// ```
class GPopover extends StatefulWidget {
  const GPopover({
    super.key,
    required this.content,
    required this.child,
    this.position = GPopoverPosition.bottom,
    this.offset = 8.0,
    this.barrierColor = Colors.transparent,
    this.barrierDismissible = true,
    this.showArrow = true,
    this.arrowSize = 10.0,
    this.maxWidth = 320.0,
    this.maxHeight,
    this.onOpen,
    this.onClose,
  });

  /// Content builder that receives a close callback
  final Widget Function(VoidCallback close) content;

  /// Trigger widget
  final Widget child;

  /// Position relative to anchor
  final GPopoverPosition position;

  /// Offset from anchor
  final double offset;

  /// Barrier color (overlay behind popover)
  final Color barrierColor;

  /// Whether tapping outside closes the popover
  final bool barrierDismissible;

  /// Whether to show arrow pointing to anchor
  final bool showArrow;

  /// Arrow size
  final double arrowSize;

  /// Maximum width of popover
  final double maxWidth;

  /// Maximum height of popover
  final double? maxHeight;

  /// Called when popover opens
  final VoidCallback? onOpen;

  /// Called when popover closes
  final VoidCallback? onClose;

  @override
  State<GPopover> createState() => _GPopoverState();
}

class _GPopoverState extends State<GPopover> {
  final GlobalKey _anchorKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;

  void _showPopover() {
    if (_isOpen) return;

    final overlay = Overlay.of(context);
    final renderBox = _anchorKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final anchorPosition = renderBox.localToGlobal(Offset.zero);
    final anchorSize = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => _PopoverOverlay(
        anchorPosition: anchorPosition,
        anchorSize: anchorSize,
        position: widget.position,
        offset: widget.offset,
        barrierColor: widget.barrierColor,
        barrierDismissible: widget.barrierDismissible,
        showArrow: widget.showArrow,
        arrowSize: widget.arrowSize,
        maxWidth: widget.maxWidth,
        maxHeight: widget.maxHeight,
        content: widget.content,
        onClose: _hidePopover,
      ),
    );

    overlay.insert(_overlayEntry!);
    _isOpen = true;
    widget.onOpen?.call();
  }

  void _hidePopover() {
    if (!_isOpen) return;

    _overlayEntry?.remove();
    _overlayEntry = null;
    _isOpen = false;
    widget.onClose?.call();
  }

  @override
  void dispose() {
    _hidePopover();
    super.dispose();
  }

  void _togglePopover() {
    if (_isOpen) {
      _hidePopover();
    } else {
      _showPopover();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        key: _anchorKey,
        behavior: HitTestBehavior.opaque,
        onTap: _togglePopover,
        child: widget.child,
      ),
    );
  }
}

class _PopoverOverlay extends StatelessWidget {
  const _PopoverOverlay({
    required this.anchorPosition,
    required this.anchorSize,
    required this.position,
    required this.offset,
    required this.barrierColor,
    required this.barrierDismissible,
    required this.showArrow,
    required this.arrowSize,
    required this.maxWidth,
    required this.maxHeight,
    required this.content,
    required this.onClose,
  });

  final Offset anchorPosition;
  final Size anchorSize;
  final GPopoverPosition position;
  final double offset;
  final Color barrierColor;
  final bool barrierDismissible;
  final bool showArrow;
  final double arrowSize;
  final double maxWidth;
  final double? maxHeight;
  final Widget Function(VoidCallback close) content;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final screenSize = MediaQuery.of(context).size;

    // Calculate popover position
    final totalOffset = offset + (showArrow ? arrowSize : 0);

    double? left;
    double? top;
    double? right;
    double? bottom;

    switch (position) {
      case GPopoverPosition.top:
        left = anchorPosition.dx + (anchorSize.width / 2) - (maxWidth / 2);
        bottom = screenSize.height - anchorPosition.dy + totalOffset;
        break;
      case GPopoverPosition.bottom:
        left = anchorPosition.dx + (anchorSize.width / 2) - (maxWidth / 2);
        top = anchorPosition.dy + anchorSize.height + totalOffset;
        break;
      case GPopoverPosition.left:
        right = screenSize.width - anchorPosition.dx + totalOffset;
        top = anchorPosition.dy + (anchorSize.height / 2) - 50;
        break;
      case GPopoverPosition.right:
        left = anchorPosition.dx + anchorSize.width + totalOffset;
        top = anchorPosition.dy + (anchorSize.height / 2) - 50;
        break;
    }

    // Ensure popover stays within screen bounds
    if (left != null) {
      left = left.clamp(8.0, screenSize.width - maxWidth - 8);
    }
    if (top != null) {
      top = top.clamp(8.0, screenSize.height - 100);
    }

    return Stack(
      children: [
        // Barrier
        Positioned.fill(
          child: GestureDetector(
            onTap: barrierDismissible ? onClose : null,
            child: Container(color: barrierColor),
          ),
        ),

        // Popover
        Positioned(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
          child: Material(
            color: Colors.transparent,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: GDurations.fast,
              curve: GEasing.easeOut,
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.scale(
                    scale: 0.95 + (0.05 * value),
                    alignment: _getTransformAlignment(),
                    child: child,
                  ),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (showArrow && position == GPopoverPosition.bottom)
                    _buildArrow(colors, isTop: true),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: maxWidth,
                      maxHeight: maxHeight ?? double.infinity,
                    ),
                    decoration: BoxDecoration(
                      color: colors.surface,
                      borderRadius: GBorderRadius.allLg,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      border: Border.all(
                        color: colors.outline.withValues(alpha: 0.1),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: GBorderRadius.allLg,
                      child: content(onClose),
                    ),
                  ),
                  if (showArrow && position == GPopoverPosition.top)
                    _buildArrow(colors, isTop: false),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Alignment _getTransformAlignment() {
    switch (position) {
      case GPopoverPosition.top:
        return Alignment.bottomCenter;
      case GPopoverPosition.bottom:
        return Alignment.topCenter;
      case GPopoverPosition.left:
        return Alignment.centerRight;
      case GPopoverPosition.right:
        return Alignment.centerLeft;
    }
  }

  Widget _buildArrow(GColorScheme colors, {required bool isTop}) {
    return CustomPaint(
      size: Size(arrowSize * 2, arrowSize),
      painter: _ArrowPainter(
        color: colors.surface,
        borderColor: colors.outline.withValues(alpha: 0.1),
        isTop: isTop,
      ),
    );
  }
}

class _ArrowPainter extends CustomPainter {
  _ArrowPainter({
    required this.color,
    required this.borderColor,
    required this.isTop,
  });

  final Color color;
  final Color borderColor;
  final bool isTop;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final path = Path();
    if (isTop) {
      path.moveTo(0, size.height);
      path.lineTo(size.width / 2, 0);
      path.lineTo(size.width, size.height);
      path.close();
    } else {
      path.moveTo(0, 0);
      path.lineTo(size.width / 2, size.height);
      path.lineTo(size.width, 0);
      path.close();
    }

    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// A controlled popover that can be opened/closed programmatically
class GPopoverController {
  _GControlledPopoverState? _state;

  void _attach(_GControlledPopoverState state) {
    _state = state;
  }

  void _detach() {
    _state = null;
  }

  /// Whether the popover is currently open
  bool get isOpen => _state?._isOpen ?? false;

  /// Open the popover
  void open() => _state?._showPopover();

  /// Close the popover
  void close() => _state?._hidePopover();

  /// Toggle the popover
  void toggle() {
    if (isOpen) {
      close();
    } else {
      open();
    }
  }
}

/// A popover that can be controlled programmatically
class GControlledPopover extends StatefulWidget {
  const GControlledPopover({
    super.key,
    required this.controller,
    required this.content,
    required this.child,
    this.position = GPopoverPosition.bottom,
    this.offset = 8.0,
    this.barrierColor = Colors.transparent,
    this.barrierDismissible = true,
    this.showArrow = true,
    this.arrowSize = 10.0,
    this.maxWidth = 320.0,
    this.maxHeight,
    this.onOpen,
    this.onClose,
  });

  /// Controller for programmatic control
  final GPopoverController controller;

  /// Content builder that receives a close callback
  final Widget Function(VoidCallback close) content;

  /// Anchor widget
  final Widget child;

  /// Position relative to anchor
  final GPopoverPosition position;

  /// Offset from anchor
  final double offset;

  /// Barrier color (overlay behind popover)
  final Color barrierColor;

  /// Whether tapping outside closes the popover
  final bool barrierDismissible;

  /// Whether to show arrow pointing to anchor
  final bool showArrow;

  /// Arrow size
  final double arrowSize;

  /// Maximum width of popover
  final double maxWidth;

  /// Maximum height of popover
  final double? maxHeight;

  /// Called when popover opens
  final VoidCallback? onOpen;

  /// Called when popover closes
  final VoidCallback? onClose;

  @override
  State<GControlledPopover> createState() => _GControlledPopoverState();
}

class _GControlledPopoverState extends State<GControlledPopover> {
  final GlobalKey _anchorKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    widget.controller._attach(this);
  }

  @override
  void dispose() {
    widget.controller._detach();
    _hidePopover();
    super.dispose();
  }

  void _showPopover() {
    if (_isOpen) return;

    final overlay = Overlay.of(context);
    final renderBox = _anchorKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final anchorPosition = renderBox.localToGlobal(Offset.zero);
    final anchorSize = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => _PopoverOverlay(
        anchorPosition: anchorPosition,
        anchorSize: anchorSize,
        position: widget.position,
        offset: widget.offset,
        barrierColor: widget.barrierColor,
        barrierDismissible: widget.barrierDismissible,
        showArrow: widget.showArrow,
        arrowSize: widget.arrowSize,
        maxWidth: widget.maxWidth,
        maxHeight: widget.maxHeight,
        content: widget.content,
        onClose: _hidePopover,
      ),
    );

    overlay.insert(_overlayEntry!);
    setState(() => _isOpen = true);
    widget.onOpen?.call();
  }

  void _hidePopover() {
    if (!_isOpen) return;

    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() => _isOpen = false);
    widget.onClose?.call();
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: _anchorKey,
      child: widget.child,
    );
  }
}

