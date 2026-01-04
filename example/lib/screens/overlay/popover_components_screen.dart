import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class PopoverComponentsScreen extends StatefulWidget {
  const PopoverComponentsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<PopoverComponentsScreen> createState() => _PopoverComponentsScreenState();
}

class _PopoverComponentsScreenState extends State<PopoverComponentsScreen> {
  final GPopoverController _controller = GPopoverController();

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return ShowcaseScaffold(
      title: 'Popover',
      subtitle: 'GPopover component',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Popover
            const SectionHeader(
              title: 'Basic Popover',
              subtitle: 'Simple popup content',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Simple Popover',
              subtitle: 'Tap to toggle',
              child: Center(
                child: GPopover(
                  content: (close) => Padding(
                    padding: const EdgeInsets.all(GSpacing.md),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Popover Title',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colors.onSurface,
                          ),
                        ),
                        const SizedBox(height: GSpacing.sm),
                        Text(
                          'This is a simple popover with some content.',
                          style: TextStyle(color: colors.onSurfaceVariant),
                        ),
                        const SizedBox(height: GSpacing.md),
                        GButton(
                          label: 'Close',
                          size: GButtonSize.sm,
                          onPressed: close,
                        ),
                      ],
                    ),
                  ),
                  child: _PopoverTrigger(
                    label: 'Show Popover',
                    colors: colors,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Popover Positions
            const SectionHeader(
              title: 'Popover Positions',
              subtitle: 'Different placement options',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Position Options',
              subtitle: 'top, bottom, left, right',
              child: Center(
                child: Wrap(
                  spacing: GSpacing.md,
                  runSpacing: GSpacing.md,
                  children: [
                    GPopover(
                      position: GPopoverPosition.top,
                      content: (close) => _buildSimpleContent(colors, 'Top Popover', close),
                      child: _PopoverTrigger(
                        label: 'Top',
                        colors: colors,
                        isSmall: true,
                      ),
                    ),
                    GPopover(
                      position: GPopoverPosition.bottom,
                      content: (close) => _buildSimpleContent(colors, 'Bottom Popover', close),
                      child: _PopoverTrigger(
                        label: 'Bottom',
                        colors: colors,
                        isSmall: true,
                      ),
                    ),
                    GPopover(
                      position: GPopoverPosition.left,
                      content: (close) => _buildSimpleContent(colors, 'Left Popover', close),
                      child: _PopoverTrigger(
                        label: 'Left',
                        colors: colors,
                        isSmall: true,
                      ),
                    ),
                    GPopover(
                      position: GPopoverPosition.right,
                      content: (close) => _buildSimpleContent(colors, 'Right Popover', close),
                      child: _PopoverTrigger(
                        label: 'Right',
                        colors: colors,
                        isSmall: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Without Arrow
            const SectionHeader(
              title: 'Without Arrow',
              subtitle: 'Cleaner look without arrow',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'No Arrow',
              subtitle: 'showArrow: false',
              child: Center(
                child: GPopover(
                  showArrow: false,
                  content: (close) => Padding(
                    padding: const EdgeInsets.all(GSpacing.md),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Popover without arrow',
                          style: TextStyle(color: colors.onSurface),
                        ),
                        const SizedBox(height: GSpacing.sm),
                        GButton(
                          label: 'Got it',
                          size: GButtonSize.sm,
                          onPressed: close,
                        ),
                      ],
                    ),
                  ),
                  child: _PopoverTrigger(
                    label: 'No Arrow Popover',
                    colors: colors,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Rich Content
            const SectionHeader(
              title: 'Rich Content',
              subtitle: 'Complex popover content',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'User Profile',
              subtitle: 'Profile card popover',
              child: Center(
                child: GPopover(
                  maxWidth: 280,
                  content: (close) => Padding(
                    padding: const EdgeInsets.all(GSpacing.lg),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GAvatar(
                          name: 'John Doe',
                          size: GAvatarSize.xl,
                        ),
                        const SizedBox(height: GSpacing.md),
                        Text(
                          'John Doe',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: colors.onSurface,
                          ),
                        ),
                        Text(
                          'john.doe@example.com',
                          style: TextStyle(
                            color: colors.onSurfaceVariant,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: GSpacing.md),
                        GBadge(
                          label: 'Premium Member',
                          color: GBadgeColor.primary,
                          variant: GBadgeVariant.soft,
                        ),
                        const SizedBox(height: GSpacing.lg),
                        Row(
                          children: [
                            Expanded(
                              child: GButton(
                                label: 'Profile',
                                variant: GButtonVariant.outlined,
                                size: GButtonSize.sm,
                                onPressed: close,
                              ),
                            ),
                            const SizedBox(width: GSpacing.sm),
                            Expanded(
                              child: GButton(
                                label: 'Message',
                                size: GButtonSize.sm,
                                onPressed: close,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  child: GAvatar(
                    name: 'John Doe',
                    size: GAvatarSize.md,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Notification Panel',
              subtitle: 'List of notifications',
              child: Center(
                child: GPopover(
                  maxWidth: 300,
                  maxHeight: 350,
                  content: (close) => Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(GSpacing.md),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Notifications',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: colors.onSurface,
                              ),
                            ),
                            GButton(
                              label: 'Mark all read',
                              variant: GButtonVariant.ghost,
                              size: GButtonSize.sm,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      const GDivider(),
                      _NotificationItem(
                        icon: Icons.message,
                        iconColor: colors.primary,
                        title: 'New message',
                        subtitle: 'You have a new message from Jane',
                        time: '2m ago',
                        colors: colors,
                      ),
                      _NotificationItem(
                        icon: Icons.person_add,
                        iconColor: colors.success,
                        title: 'New follower',
                        subtitle: 'Alex started following you',
                        time: '1h ago',
                        colors: colors,
                      ),
                      _NotificationItem(
                        icon: Icons.favorite,
                        iconColor: colors.error,
                        title: 'Post liked',
                        subtitle: '5 people liked your post',
                        time: '3h ago',
                        colors: colors,
                      ),
                      const GDivider(),
                      Padding(
                        padding: const EdgeInsets.all(GSpacing.sm),
                        child: Center(
                          child: GButton(
                            label: 'View all notifications',
                            variant: GButtonVariant.ghost,
                            size: GButtonSize.sm,
                            onPressed: close,
                          ),
                        ),
                      ),
                    ],
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(GSpacing.sm),
                        decoration: BoxDecoration(
                          color: colors.surfaceVariant,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.notifications_outlined,
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                      Positioned(
                        right: 2,
                        top: 2,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: colors.error,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Controlled Popover
            const SectionHeader(
              title: 'Controlled Popover',
              subtitle: 'Programmatic control with GPopoverController',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Controller',
              subtitle: 'Open/close via controller',
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GButton(
                        label: 'Open',
                        size: GButtonSize.sm,
                        onPressed: () => _controller.open(),
                      ),
                      const SizedBox(width: GSpacing.sm),
                      GButton(
                        label: 'Close',
                        variant: GButtonVariant.outlined,
                        size: GButtonSize.sm,
                        onPressed: () => _controller.close(),
                      ),
                      const SizedBox(width: GSpacing.sm),
                      GButton(
                        label: 'Toggle',
                        variant: GButtonVariant.ghost,
                        size: GButtonSize.sm,
                        onPressed: () => _controller.toggle(),
                      ),
                    ],
                  ),
                  const SizedBox(height: GSpacing.lg),
                  Center(
                    child: GControlledPopover(
                      controller: _controller,
                      content: (close) => Padding(
                        padding: const EdgeInsets.all(GSpacing.md),
                        child: Text(
                          'This popover is controlled programmatically!',
                          style: TextStyle(color: colors.onSurface),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(GSpacing.md),
                        decoration: BoxDecoration(
                          color: colors.primaryContainer,
                          borderRadius: GBorderRadius.allMd,
                        ),
                        child: Text(
                          'Anchor Element',
                          style: TextStyle(color: colors.onPrimaryContainer),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Form Popover
            const SectionHeader(
              title: 'Form Popover',
              subtitle: 'Inline editing with popover',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Quick Edit',
              subtitle: 'Edit form in popover',
              child: Center(
                child: GPopover(
                  maxWidth: 280,
                  content: (close) => Padding(
                    padding: const EdgeInsets.all(GSpacing.md),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quick Edit',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colors.onSurface,
                          ),
                        ),
                        const SizedBox(height: GSpacing.md),
                        const GTextField(
                          label: 'Title',
                          hint: 'Enter title',
                        ),
                        const SizedBox(height: GSpacing.md),
                        Row(
                          children: [
                            Expanded(
                              child: GButton(
                                label: 'Cancel',
                                variant: GButtonVariant.outlined,
                                size: GButtonSize.sm,
                                onPressed: close,
                              ),
                            ),
                            const SizedBox(width: GSpacing.sm),
                            Expanded(
                              child: GButton(
                                label: 'Save',
                                size: GButtonSize.sm,
                                onPressed: () {
                                  close();
                                  GToastController.success(context, 'Saved!');
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'My Document Title',
                        style: TextStyle(color: colors.onSurface),
                      ),
                      const SizedBox(width: GSpacing.xs),
                      Icon(Icons.edit, size: 16, color: colors.primary),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl2),
          ],
        ),
      ),
    );
  }

  Widget _buildSimpleContent(GColorScheme colors, String title, VoidCallback close) {
    return Padding(
      padding: const EdgeInsets.all(GSpacing.md),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: colors.onSurface,
            ),
          ),
          const SizedBox(height: GSpacing.sm),
          Text(
            'Popover content here',
            style: TextStyle(color: colors.onSurfaceVariant),
          ),
          const SizedBox(height: GSpacing.md),
          GButton(
            label: 'Close',
            size: GButtonSize.sm,
            onPressed: close,
          ),
        ],
      ),
    );
  }
}

class _NotificationItem extends StatelessWidget {
  const _NotificationItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.colors,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String time;
  final GColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: GSpacing.md,
        vertical: GSpacing.sm,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(GSpacing.xs),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 16, color: iconColor),
          ),
          const SizedBox(width: GSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: colors.onSurface,
                    fontSize: 13,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: colors.onSurfaceVariant,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: TextStyle(
              color: colors.onSurfaceVariant,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

/// A custom trigger widget that looks like an outlined button
/// but doesn't consume tap events (for use with GPopover)
class _PopoverTrigger extends StatefulWidget {
  const _PopoverTrigger({
    required this.label,
    required this.colors,
    this.isSmall = false,
  });

  final String label;
  final GColorScheme colors;
  final bool isSmall;

  @override
  State<_PopoverTrigger> createState() => _PopoverTriggerState();
}

class _PopoverTriggerState extends State<_PopoverTrigger> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.symmetric(
          horizontal: widget.isSmall ? GSpacing.md : GSpacing.lg,
          vertical: widget.isSmall ? GSpacing.xs : GSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: _isHovered
              ? widget.colors.primary.withValues(alpha: 0.08)
              : Colors.transparent,
          border: Border.all(
            color: _isHovered ? widget.colors.primary : widget.colors.outline,
          ),
          borderRadius: GBorderRadius.allMd,
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            color: widget.colors.primary,
            fontWeight: FontWeight.w500,
            fontSize: widget.isSmall ? 13 : 14,
          ),
        ),
      ),
    );
  }
}

