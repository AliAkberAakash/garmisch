import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      title: 'Text Field',
      subtitle: 'GTextField component',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Variants
            const SectionHeader(
              title: 'Variants',
              subtitle: 'Different text field styles',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'TextField Variants',
              subtitle: 'GTextFieldVariant enum',
              child: Column(
                children: [
                  const GTextField(
                    label: 'Outlined',
                    hint: 'Default outlined style',
                    variant: GTextFieldVariant.outlined,
                  ),
                  const SizedBox(height: GSpacing.md),
                  const GTextField(
                    label: 'Filled',
                    hint: 'Filled background style',
                    variant: GTextFieldVariant.filled,
                  ),
                  const SizedBox(height: GSpacing.md),
                  const GTextField(
                    label: 'Underlined',
                    hint: 'Bottom border only',
                    variant: GTextFieldVariant.underlined,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Sizes
            const SectionHeader(
              title: 'Sizes',
              subtitle: 'Different text field sizes',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'TextField Sizes',
              subtitle: 'GTextFieldSize enum',
              child: Column(
                children: [
                  const GTextField(
                    label: 'Small',
                    hint: 'Small text field',
                    size: GTextFieldSize.sm,
                  ),
                  const SizedBox(height: GSpacing.md),
                  const GTextField(
                    label: 'Medium',
                    hint: 'Medium text field (default)',
                    size: GTextFieldSize.md,
                  ),
                  const SizedBox(height: GSpacing.md),
                  const GTextField(
                    label: 'Large',
                    hint: 'Large text field',
                    size: GTextFieldSize.lg,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // With Icons
            const SectionHeader(
              title: 'With Icons',
              subtitle: 'Prefix and suffix icons',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Icons',
              subtitle: 'prefixIcon and suffixIcon props',
              child: Column(
                children: [
                  const GTextField(
                    label: 'Email',
                    hint: 'Enter your email',
                    prefixIcon: Icons.email_outlined,
                  ),
                  const SizedBox(height: GSpacing.md),
                  const GTextField(
                    label: 'Search',
                    hint: 'Search...',
                    prefixIcon: Icons.search,
                    suffixIcon: Icons.mic_outlined,
                  ),
                  const SizedBox(height: GSpacing.md),
                  GTextField(
                    label: 'Password',
                    hint: 'Enter password',
                    prefixIcon: Icons.lock_outlined,
                    obscureText: _obscurePassword,
                    suffix: GestureDetector(
                      onTap: () => setState(() => _obscurePassword = !_obscurePassword),
                      child: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // States
            const SectionHeader(
              title: 'States',
              subtitle: 'Error, disabled, and required states',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Field States',
              subtitle: 'errorText, isDisabled, isRequired props',
              child: Column(
                children: [
                  const GTextField(
                    label: 'Required Field',
                    hint: 'This field is required',
                    isRequired: true,
                  ),
                  const SizedBox(height: GSpacing.md),
                  const GTextField(
                    label: 'With Error',
                    hint: 'Enter value',
                    errorText: 'This field has an error',
                  ),
                  const SizedBox(height: GSpacing.md),
                  const GTextField(
                    label: 'With Helper',
                    hint: 'Enter value',
                    helperText: 'This is helper text',
                  ),
                  const SizedBox(height: GSpacing.md),
                  const GTextField(
                    label: 'Disabled',
                    hint: 'Cannot edit this',
                    isDisabled: true,
                  ),
                  const SizedBox(height: GSpacing.md),
                  const GTextField(
                    label: 'Read Only',
                    hint: 'Read only value',
                    isReadOnly: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Multiline
            const SectionHeader(
              title: 'Multiline',
              subtitle: 'Text area for longer content',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Multiline TextField',
              subtitle: 'maxLines prop',
              child: Column(
                children: [
                  const GTextField(
                    label: 'Description',
                    hint: 'Enter a description...',
                    maxLines: 4,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl2),
          ],
        ),
      ),
    );
  }
}

