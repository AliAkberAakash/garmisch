# Garmisch Design System Specification

A minimalistic design system based on Material Design for Flutter.

---

## Table of Contents

1. [Architecture Overview](#architecture-overview)
2. [Foundations](#foundations)
3. [Theme System](#theme-system)
4. [Components](#components)
5. [Utilities](#utilities)

---

## Architecture Overview

### File Structure

```
lib/
├── garmisch.dart                    # Main barrel export
└── src/
    ├── foundations/
    │   ├── foundations.dart         # Barrel export
    │   ├── colors.dart              # GColors
    │   ├── typography.dart          # GTypography
    │   ├── spacing.dart             # GSpacing
    │   ├── sizing.dart              # GSizing
    │   ├── border_radius.dart       # GBorderRadius
    │   ├── border_width.dart        # GBorderWidth
    │   ├── shadows.dart             # GShadows
    │   ├── opacity.dart             # GOpacity
    │   ├── breakpoints.dart         # GBreakpoints
    │   ├── durations.dart           # GDurations
    │   └── easing.dart              # GEasing
    │
    ├── theme/
    │   ├── theme.dart               # Barrel export
    │   ├── theme_data.dart          # GThemeData
    │   ├── theme_provider.dart      # GTheme (InheritedWidget)
    │   ├── theme_extension.dart     # BuildContext extensions
    │   ├── color_scheme.dart        # GColorScheme
    │   └── text_theme.dart          # GTextTheme
    │
    ├── components/
    │   ├── components.dart          # Barrel export
    │   │
    │   ├── inputs/
    │   │   ├── inputs.dart          # Barrel export
    │   │   ├── button.dart          # GButton
    │   │   ├── icon_button.dart     # GIconButton
    │   │   ├── text_field.dart      # GTextField
    │   │   ├── checkbox.dart        # GCheckbox
    │   │   ├── radio.dart           # GRadio
    │   │   ├── switch.dart          # GSwitch
    │   │   ├── slider.dart          # GSlider
    │   │   ├── dropdown.dart        # GDropdown
    │   │   ├── date_picker.dart     # GDatePicker
    │   │   ├── time_picker.dart     # GTimePicker
    │   │   └── search_field.dart    # GSearchField
    │   │
    │   ├── display/
    │   │   ├── display.dart         # Barrel export
    │   │   ├── text.dart            # GText
    │   │   ├── avatar.dart          # GAvatar
    │   │   ├── badge.dart           # GBadge
    │   │   ├── chip.dart            # GChip
    │   │   ├── tag.dart             # GTag
    │   │   ├── divider.dart         # GDivider
    │   │   ├── image.dart           # GImage
    │   │   ├── icon.dart            # GIcon
    │   │   ├── progress_bar.dart    # GProgressBar
    │   │   ├── progress_circle.dart # GProgressCircle
    │   │   ├── skeleton.dart        # GSkeleton
    │   │   └── tooltip.dart         # GTooltip
    │   │
    │   ├── feedback/
    │   │   ├── feedback.dart        # Barrel export
    │   │   ├── alert.dart           # GAlert
    │   │   ├── toast.dart           # GToast
    │   │   ├── snackbar.dart        # GSnackbar
    │   │   ├── banner.dart          # GBanner
    │   │   └── empty_state.dart     # GEmptyState
    │   │
    │   ├── navigation/
    │   │   ├── navigation.dart      # Barrel export
    │   │   ├── app_bar.dart         # GAppBar
    │   │   ├── bottom_nav.dart      # GBottomNav
    │   │   ├── tab_bar.dart         # GTabBar
    │   │   ├── drawer.dart          # GDrawer
    │   │   ├── breadcrumb.dart      # GBreadcrumb
    │   │   ├── pagination.dart      # GPagination
    │   │   ├── stepper.dart         # GStepper
    │   │   └── link.dart            # GLink
    │   │
    │   ├── layout/
    │   │   ├── layout.dart          # Barrel export
    │   │   ├── card.dart            # GCard
    │   │   ├── container.dart       # GContainer
    │   │   ├── grid.dart            # GGrid
    │   │   ├── stack.dart           # GStack
    │   │   ├── row.dart             # GRow
    │   │   ├── column.dart          # GColumn
    │   │   ├── spacer.dart          # GSpacer
    │   │   ├── gap.dart             # GGap
    │   │   ├── responsive.dart      # GResponsive
    │   │   ├── scaffold.dart        # GScaffold
    │   │   ├── list_tile.dart       # GListTile
    │   │   ├── expansion_tile.dart  # GExpansionTile
    │   │   └── accordion.dart       # GAccordion
    │   │
    │   └── overlay/
    │       ├── overlay.dart         # Barrel export
    │       ├── dialog.dart          # GDialog
    │       ├── modal.dart           # GModal
    │       ├── bottom_sheet.dart    # GBottomSheet
    │       ├── popup_menu.dart      # GPopupMenu
    │       └── overlay_portal.dart  # GOverlayPortal
    │
    └── utilities/
        ├── utilities.dart           # Barrel export
        ├── extensions/
        │   ├── extensions.dart      # Barrel export
        │   ├── context_ext.dart     # BuildContext extensions
        │   ├── color_ext.dart       # Color extensions
        │   ├── text_style_ext.dart  # TextStyle extensions
        │   ├── widget_ext.dart      # Widget extensions
        │   └── num_ext.dart         # Number extensions
        │
        ├── helpers/
        │   ├── helpers.dart         # Barrel export
        │   ├── responsive.dart      # Responsive helpers
        │   ├── platform.dart        # Platform detection
        │   └── contrast.dart        # Color contrast utilities
        │
        └── accessibility/
            ├── accessibility.dart   # Barrel export
            ├── semantics.dart       # Semantic helpers
            └── focus.dart           # Focus management
```

---

## Foundations

### 1. Colors (`GColors`)

#### Scale Colors (Reference Tokens)

| Token Name | Values |
|------------|--------|
| `gray` | 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950 |
| `red` | 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950 |
| `orange` | 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950 |
| `amber` | 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950 |
| `yellow` | 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950 |
| `lime` | 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950 |
| `green` | 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950 |
| `emerald` | 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950 |
| `teal` | 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950 |
| `cyan` | 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950 |
| `sky` | 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950 |
| `blue` | 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950 |
| `indigo` | 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950 |
| `violet` | 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950 |
| `purple` | 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950 |
| `fuchsia` | 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950 |
| `pink` | 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950 |
| `rose` | 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950 |

#### Base Colors

| Token | Value |
|-------|-------|
| `white` | #FFFFFF |
| `black` | #000000 |
| `transparent` | transparent |

---

### 2. Typography (`GTypography`)

#### Font Families

| Token | Value |
|-------|-------|
| `fontFamilySans` | 'Inter', system-ui, sans-serif |
| `fontFamilySerif` | 'Georgia', serif |
| `fontFamilyMono` | 'JetBrains Mono', monospace |

#### Font Sizes

| Token | Size | Line Height |
|-------|------|-------------|
| `xs` | 12px | 16px |
| `sm` | 14px | 20px |
| `base` | 16px | 24px |
| `lg` | 18px | 28px |
| `xl` | 20px | 28px |
| `xl2` | 24px | 32px |
| `xl3` | 30px | 36px |
| `xl4` | 36px | 40px |
| `xl5` | 48px | 48px |
| `xl6` | 60px | 60px |
| `xl7` | 72px | 72px |
| `xl8` | 96px | 96px |
| `xl9` | 128px | 128px |

#### Font Weights

| Token | Value |
|-------|-------|
| `thin` | 100 |
| `extraLight` | 200 |
| `light` | 300 |
| `regular` | 400 |
| `medium` | 500 |
| `semiBold` | 600 |
| `bold` | 700 |
| `extraBold` | 800 |
| `black` | 900 |

#### Letter Spacing

| Token | Value |
|-------|-------|
| `tighter` | -0.05em |
| `tight` | -0.025em |
| `normal` | 0em |
| `wide` | 0.025em |
| `wider` | 0.05em |
| `widest` | 0.1em |

---

### 3. Spacing (`GSpacing`)

| Token | Value |
|-------|-------|
| `none` | 0 |
| `px` | 1px |
| `xs4` | 2px |
| `xs3` | 4px |
| `xs2` | 6px |
| `xs` | 8px |
| `sm` | 12px |
| `md` | 16px |
| `lg` | 20px |
| `xl` | 24px |
| `xl2` | 32px |
| `xl3` | 40px |
| `xl4` | 48px |
| `xl5` | 56px |
| `xl6` | 64px |
| `xl7` | 80px |
| `xl8` | 96px |
| `xl9` | 112px |
| `xl10` | 128px |
| `xl11` | 144px |
| `xl12` | 160px |

---

### 4. Sizing (`GSizing`)

| Token | Value |
|-------|-------|
| `none` | 0 |
| `px` | 1px |
| `xs4` | 2px |
| `xs3` | 4px |
| `xs2` | 6px |
| `xs` | 8px |
| `sm` | 12px |
| `md` | 16px |
| `lg` | 20px |
| `xl` | 24px |
| `xl2` | 32px |
| `xl3` | 40px |
| `xl4` | 48px |
| `xl5` | 56px |
| `xl6` | 64px |
| `xl7` | 80px |
| `xl8` | 96px |
| `xl9` | 112px |
| `xl10` | 128px |
| `xl11` | 144px |
| `xl12` | 160px |
| `xl13` | 176px |
| `xl14` | 192px |
| `xl15` | 208px |
| `xl16` | 224px |
| `xl17` | 240px |
| `xl18` | 256px |
| `xl19` | 288px |
| `xl20` | 320px |
| `xl21` | 384px |
| `full` | 100% |
| `screen` | 100vw/100vh |
| `min` | min-content |
| `max` | max-content |
| `fit` | fit-content |

---

### 5. Border Radius (`GBorderRadius`)

| Token | Value |
|-------|-------|
| `none` | 0 |
| `xs` | 2px |
| `sm` | 4px |
| `md` | 6px |
| `lg` | 8px |
| `xl` | 12px |
| `xl2` | 16px |
| `xl3` | 24px |
| `xl4` | 32px |
| `full` | 9999px |

---

### 6. Border Width (`GBorderWidth`)

| Token | Value |
|-------|-------|
| `none` | 0 |
| `thin` | 1px |
| `medium` | 2px |
| `thick` | 4px |
| `heavy` | 8px |

---

### 7. Shadows (`GShadows`)

| Token | Description |
|-------|-------------|
| `none` | No shadow |
| `xs` | Subtle shadow (1px blur) |
| `sm` | Small shadow (2px blur) |
| `md` | Medium shadow (6px blur) |
| `lg` | Large shadow (15px blur) |
| `xl` | Extra large shadow (25px blur) |
| `xl2` | 2XL shadow (50px blur) |
| `inner` | Inset shadow |

---

### 8. Opacity (`GOpacity`)

| Token | Value |
|-------|-------|
| `transparent` | 0 |
| `5` | 0.05 |
| `10` | 0.10 |
| `20` | 0.20 |
| `25` | 0.25 |
| `30` | 0.30 |
| `40` | 0.40 |
| `50` | 0.50 |
| `60` | 0.60 |
| `70` | 0.70 |
| `75` | 0.75 |
| `80` | 0.80 |
| `90` | 0.90 |
| `95` | 0.95 |
| `opaque` | 1.0 |

---

### 9. Breakpoints (`GBreakpoints`)

| Token | Value | Description |
|-------|-------|-------------|
| `xs` | 0px | Extra small (phones portrait) |
| `sm` | 576px | Small (phones landscape) |
| `md` | 768px | Medium (tablets) |
| `lg` | 992px | Large (desktops) |
| `xl` | 1200px | Extra large (large desktops) |
| `xl2` | 1400px | 2XL (wide screens) |

---

### 10. Durations (`GDurations`)

| Token | Value | Use Case |
|-------|-------|----------|
| `instant` | 0ms | Immediate |
| `fastest` | 50ms | Micro-interactions |
| `faster` | 100ms | Quick feedback |
| `fast` | 150ms | Button states |
| `normal` | 200ms | Default transitions |
| `slow` | 300ms | Page transitions |
| `slower` | 400ms | Complex animations |
| `slowest` | 500ms | Elaborate animations |

---

### 11. Easing Curves (`GEasing`)

| Token | Value | Use Case |
|-------|-------|----------|
| `linear` | linear | Constant speed |
| `easeIn` | cubic-bezier(0.4, 0, 1, 1) | Acceleration |
| `easeOut` | cubic-bezier(0, 0, 0.2, 1) | Deceleration |
| `easeInOut` | cubic-bezier(0.4, 0, 0.2, 1) | Standard |
| `easeInSine` | cubic-bezier(0.12, 0, 0.39, 0) | Gentle start |
| `easeOutSine` | cubic-bezier(0.61, 1, 0.88, 1) | Gentle end |
| `easeInOutSine` | cubic-bezier(0.37, 0, 0.63, 1) | Gentle both |
| `easeInQuad` | cubic-bezier(0.11, 0, 0.5, 0) | Moderate start |
| `easeOutQuad` | cubic-bezier(0.5, 1, 0.89, 1) | Moderate end |
| `easeInOutQuad` | cubic-bezier(0.45, 0, 0.55, 1) | Moderate both |
| `easeInCubic` | cubic-bezier(0.32, 0, 0.67, 0) | Strong start |
| `easeOutCubic` | cubic-bezier(0.33, 1, 0.68, 1) | Strong end |
| `easeInOutCubic` | cubic-bezier(0.65, 0, 0.35, 1) | Strong both |
| `easeInBack` | cubic-bezier(0.36, 0, 0.66, -0.56) | Overshoot start |
| `easeOutBack` | cubic-bezier(0.34, 1.56, 0.64, 1) | Overshoot end |
| `easeInOutBack` | cubic-bezier(0.68, -0.6, 0.32, 1.6) | Overshoot both |
| `spring` | cubic-bezier(0.175, 0.885, 0.32, 1.275) | Bouncy |

---

## Theme System

### GColorScheme

#### Light Mode

| Token | Description | Default Value |
|-------|-------------|---------------|
| `primary` | Primary brand color | blue.600 |
| `onPrimary` | Text on primary | white |
| `primaryContainer` | Primary container | blue.100 |
| `onPrimaryContainer` | Text on primary container | blue.900 |
| `secondary` | Secondary brand color | gray.600 |
| `onSecondary` | Text on secondary | white |
| `secondaryContainer` | Secondary container | gray.100 |
| `onSecondaryContainer` | Text on secondary container | gray.900 |
| `tertiary` | Tertiary accent | teal.600 |
| `onTertiary` | Text on tertiary | white |
| `tertiaryContainer` | Tertiary container | teal.100 |
| `onTertiaryContainer` | Text on tertiary container | teal.900 |
| `error` | Error color | red.600 |
| `onError` | Text on error | white |
| `errorContainer` | Error container | red.100 |
| `onErrorContainer` | Text on error container | red.900 |
| `warning` | Warning color | amber.500 |
| `onWarning` | Text on warning | black |
| `warningContainer` | Warning container | amber.100 |
| `onWarningContainer` | Text on warning container | amber.900 |
| `success` | Success color | green.600 |
| `onSuccess` | Text on success | white |
| `successContainer` | Success container | green.100 |
| `onSuccessContainer` | Text on success container | green.900 |
| `info` | Info color | blue.500 |
| `onInfo` | Text on info | white |
| `infoContainer` | Info container | blue.100 |
| `onInfoContainer` | Text on info container | blue.900 |
| `background` | Page background | gray.50 |
| `onBackground` | Text on background | gray.900 |
| `surface` | Surface color | white |
| `onSurface` | Text on surface | gray.900 |
| `surfaceVariant` | Variant surface | gray.100 |
| `onSurfaceVariant` | Text on variant surface | gray.700 |
| `outline` | Border/outline color | gray.300 |
| `outlineVariant` | Subtle outline | gray.200 |
| `shadow` | Shadow color | black |
| `scrim` | Overlay scrim | black |
| `inverseSurface` | Inverse surface | gray.900 |
| `onInverseSurface` | Text on inverse surface | gray.50 |
| `inversePrimary` | Inverse primary | blue.300 |
| `disabled` | Disabled state | gray.400 |
| `onDisabled` | Text on disabled | gray.600 |

#### Dark Mode

Same tokens with inverted/adjusted values for dark theme.

---

### GTextTheme

| Token | Font Size | Font Weight | Letter Spacing | Use Case |
|-------|-----------|-------------|----------------|----------|
| `displayLarge` | xl7 (72px) | regular | tight | Hero text |
| `displayMedium` | xl6 (60px) | regular | tight | Large headlines |
| `displaySmall` | xl5 (48px) | regular | normal | Section headers |
| `headlineLarge` | xl4 (36px) | semiBold | normal | Page titles |
| `headlineMedium` | xl3 (30px) | semiBold | normal | Section titles |
| `headlineSmall` | xl2 (24px) | semiBold | normal | Card titles |
| `titleLarge` | xl (20px) | medium | normal | List titles |
| `titleMedium` | base (16px) | medium | wide | Subtitles |
| `titleSmall` | sm (14px) | medium | wide | Small titles |
| `labelLarge` | sm (14px) | semiBold | wide | Button labels |
| `labelMedium` | xs (12px) | semiBold | wider | Tags, badges |
| `labelSmall` | xs (12px) | medium | wider | Captions |
| `bodyLarge` | base (16px) | regular | normal | Primary body |
| `bodyMedium` | sm (14px) | regular | normal | Secondary body |
| `bodySmall` | xs (12px) | regular | normal | Tertiary body |

---

## Components

### Input Components

#### GButton

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | String? | null | Button text |
| `onPressed` | VoidCallback? | null | Press handler |
| `variant` | GButtonVariant | primary | Button style variant |
| `size` | GButtonSize | medium | Button size |
| `icon` | IconData? | null | Leading icon |
| `trailingIcon` | IconData? | null | Trailing icon |
| `isLoading` | bool | false | Loading state |
| `isDisabled` | bool | false | Disabled state |
| `isFullWidth` | bool | false | Full width button |

**GButtonVariant Enum:**
- `primary` — Solid primary color
- `secondary` — Solid secondary color
- `tertiary` — Solid tertiary color
- `outlined` — Border only
- `ghost` — No background
- `destructive` — Red/error color
- `link` — Text link style

**GButtonSize Enum:**
- `xs` — Extra small (28px height)
- `sm` — Small (32px height)
- `md` — Medium (40px height)
- `lg` — Large (48px height)
- `xl` — Extra large (56px height)

---

#### GIconButton

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `icon` | IconData | required | Button icon |
| `onPressed` | VoidCallback? | null | Press handler |
| `variant` | GIconButtonVariant | standard | Button style |
| `size` | GIconButtonSize | medium | Button size |
| `isDisabled` | bool | false | Disabled state |
| `tooltip` | String? | null | Tooltip text |

**GIconButtonVariant Enum:**
- `standard` — No background
- `filled` — Solid background
- `filledTonal` — Tonal background
- `outlined` — Border only

---

#### GTextField

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `controller` | TextEditingController? | null | Text controller |
| `label` | String? | null | Field label |
| `hint` | String? | null | Placeholder text |
| `helperText` | String? | null | Helper text |
| `errorText` | String? | null | Error message |
| `variant` | GTextFieldVariant | outlined | Field style |
| `size` | GTextFieldSize | medium | Field size |
| `prefixIcon` | IconData? | null | Leading icon |
| `suffixIcon` | IconData? | null | Trailing icon |
| `isDisabled` | bool | false | Disabled state |
| `isReadOnly` | bool | false | Read-only state |
| `isRequired` | bool | false | Required field |
| `obscureText` | bool | false | Password mode |
| `maxLines` | int | 1 | Max lines |
| `keyboardType` | TextInputType | text | Keyboard type |
| `onChanged` | ValueChanged<String>? | null | Change handler |
| `onSubmitted` | ValueChanged<String>? | null | Submit handler |
| `validator` | FormFieldValidator<String>? | null | Validation |

**GTextFieldVariant Enum:**
- `outlined` — Border style
- `filled` — Filled background
- `underlined` — Bottom border only

---

#### GCheckbox

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `value` | bool | false | Checked state |
| `onChanged` | ValueChanged<bool>? | null | Change handler |
| `label` | String? | null | Label text |
| `isDisabled` | bool | false | Disabled state |
| `isIndeterminate` | bool | false | Indeterminate state |
| `size` | GCheckboxSize | medium | Checkbox size |

---

#### GRadio

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `value` | T | required | Radio value |
| `groupValue` | T | required | Selected value |
| `onChanged` | ValueChanged<T>? | null | Change handler |
| `label` | String? | null | Label text |
| `isDisabled` | bool | false | Disabled state |
| `size` | GRadioSize | medium | Radio size |

---

#### GSwitch

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `value` | bool | false | Switch state |
| `onChanged` | ValueChanged<bool>? | null | Change handler |
| `label` | String? | null | Label text |
| `isDisabled` | bool | false | Disabled state |
| `size` | GSwitchSize | medium | Switch size |

---

#### GSlider

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `value` | double | required | Current value |
| `min` | double | 0 | Minimum value |
| `max` | double | 100 | Maximum value |
| `divisions` | int? | null | Step divisions |
| `onChanged` | ValueChanged<double>? | null | Change handler |
| `label` | String? | null | Display label |
| `isDisabled` | bool | false | Disabled state |

---

#### GDropdown

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `value` | T? | null | Selected value |
| `items` | List<GDropdownItem<T>> | required | Dropdown items |
| `onChanged` | ValueChanged<T?>? | null | Change handler |
| `label` | String? | null | Field label |
| `hint` | String? | null | Placeholder |
| `variant` | GDropdownVariant | outlined | Field style |
| `isDisabled` | bool | false | Disabled state |
| `isSearchable` | bool | false | Searchable mode |

---

#### GSearchField

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `controller` | TextEditingController? | null | Text controller |
| `hint` | String? | 'Search...' | Placeholder |
| `onChanged` | ValueChanged<String>? | null | Change handler |
| `onSubmitted` | ValueChanged<String>? | null | Submit handler |
| `onClear` | VoidCallback? | null | Clear handler |
| `isLoading` | bool | false | Loading state |

---

### Display Components

#### GText

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `data` | String | required | Text content |
| `style` | GTextStyle? | null | Text style token |
| `color` | Color? | null | Text color |
| `align` | TextAlign? | null | Text alignment |
| `overflow` | TextOverflow? | null | Overflow handling |
| `maxLines` | int? | null | Max lines |
| `selectable` | bool | false | Selectable text |

**GTextStyle Enum:**
- All tokens from GTextTheme (displayLarge, bodyMedium, etc.)

---

#### GAvatar

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `imageUrl` | String? | null | Image URL |
| `initials` | String? | null | Fallback initials |
| `icon` | IconData? | null | Fallback icon |
| `size` | GAvatarSize | medium | Avatar size |
| `shape` | GAvatarShape | circle | Avatar shape |
| `backgroundColor` | Color? | null | Background color |
| `borderColor` | Color? | null | Border color |
| `onTap` | VoidCallback? | null | Tap handler |

**GAvatarSize Enum:**
- `xs` — 24px
- `sm` — 32px
- `md` — 40px
- `lg` — 48px
- `xl` — 64px
- `xl2` — 96px

**GAvatarShape Enum:**
- `circle`
- `square`
- `rounded`

---

#### GBadge

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | String? | null | Badge text |
| `count` | int? | null | Badge count |
| `variant` | GBadgeVariant | primary | Badge style |
| `size` | GBadgeSize | medium | Badge size |
| `showZero` | bool | false | Show when zero |
| `max` | int | 99 | Max display count |

**GBadgeVariant Enum:**
- `primary`, `secondary`, `success`, `warning`, `error`, `info`

---

#### GChip

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | String | required | Chip text |
| `variant` | GChipVariant | filled | Chip style |
| `size` | GChipSize | medium | Chip size |
| `leadingIcon` | IconData? | null | Leading icon |
| `avatar` | Widget? | null | Leading avatar |
| `onPressed` | VoidCallback? | null | Press handler |
| `onDeleted` | VoidCallback? | null | Delete handler |
| `isSelected` | bool | false | Selected state |
| `isDisabled` | bool | false | Disabled state |

**GChipVariant Enum:**
- `filled`, `outlined`, `elevated`

---

#### GTag

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | String | required | Tag text |
| `color` | Color? | null | Tag color |
| `variant` | GTagVariant | filled | Tag style |
| `size` | GTagSize | medium | Tag size |
| `onDeleted` | VoidCallback? | null | Delete handler |

---

#### GDivider

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `direction` | Axis | horizontal | Divider direction |
| `thickness` | double? | null | Line thickness |
| `color` | Color? | null | Line color |
| `indent` | double | 0 | Start indent |
| `endIndent` | double | 0 | End indent |
| `label` | String? | null | Center label |

---

#### GImage

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `src` | String | required | Image source |
| `width` | double? | null | Image width |
| `height` | double? | null | Image height |
| `fit` | BoxFit | cover | Image fit |
| `borderRadius` | BorderRadius? | null | Corner radius |
| `placeholder` | Widget? | null | Loading widget |
| `errorWidget` | Widget? | null | Error widget |

---

#### GProgressBar

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `value` | double? | null | Progress (0-1) |
| `variant` | GProgressVariant | primary | Progress color |
| `size` | GProgressSize | medium | Bar height |
| `isIndeterminate` | bool | false | Indeterminate mode |
| `showLabel` | bool | false | Show percentage |

---

#### GProgressCircle

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `value` | double? | null | Progress (0-1) |
| `variant` | GProgressVariant | primary | Progress color |
| `size` | GProgressCircleSize | medium | Circle size |
| `strokeWidth` | double? | null | Stroke width |
| `isIndeterminate` | bool | false | Indeterminate mode |
| `child` | Widget? | null | Center widget |

---

#### GSkeleton

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `width` | double? | null | Skeleton width |
| `height` | double? | null | Skeleton height |
| `borderRadius` | BorderRadius? | null | Corner radius |
| `variant` | GSkeletonVariant | rectangular | Shape variant |

**GSkeletonVariant Enum:**
- `rectangular`, `circular`, `text`, `avatar`, `button`

---

#### GTooltip

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `message` | String | required | Tooltip text |
| `child` | Widget | required | Target widget |
| `position` | GTooltipPosition | top | Tooltip position |
| `showDuration` | Duration? | null | Display duration |

---

### Feedback Components

#### GAlert

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `title` | String? | null | Alert title |
| `message` | String | required | Alert message |
| `variant` | GAlertVariant | info | Alert type |
| `icon` | IconData? | null | Custom icon |
| `isDismissible` | bool | false | Can dismiss |
| `onDismiss` | VoidCallback? | null | Dismiss handler |
| `actions` | List<Widget>? | null | Action buttons |

**GAlertVariant Enum:**
- `info`, `success`, `warning`, `error`

---

#### GToast

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `message` | String | required | Toast message |
| `variant` | GToastVariant | info | Toast type |
| `duration` | Duration | 4s | Display duration |
| `action` | Widget? | null | Action button |
| `position` | GToastPosition | bottom | Toast position |

Static methods:
- `GToast.show(context, message, variant)`
- `GToast.success(context, message)`
- `GToast.error(context, message)`
- `GToast.warning(context, message)`
- `GToast.info(context, message)`

---

#### GSnackbar

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `message` | String | required | Snackbar message |
| `variant` | GSnackbarVariant | neutral | Snackbar type |
| `action` | SnackBarAction? | null | Action button |
| `duration` | Duration | 4s | Display duration |
| `isDismissible` | bool | true | Can dismiss |

---

#### GBanner

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `message` | String | required | Banner message |
| `variant` | GBannerVariant | info | Banner type |
| `icon` | IconData? | null | Leading icon |
| `actions` | List<Widget>? | null | Action buttons |
| `isDismissible` | bool | false | Can dismiss |

---

#### GEmptyState

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `icon` | IconData? | null | Illustration icon |
| `image` | Widget? | null | Illustration image |
| `title` | String | required | Title text |
| `description` | String? | null | Description text |
| `action` | Widget? | null | Action button |

---

### Navigation Components

#### GAppBar

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `title` | String? | null | Title text |
| `titleWidget` | Widget? | null | Custom title |
| `leading` | Widget? | null | Leading widget |
| `actions` | List<Widget>? | null | Action widgets |
| `variant` | GAppBarVariant | surface | App bar style |
| `centerTitle` | bool | false | Center title |
| `elevation` | double? | null | Shadow elevation |
| `bottom` | PreferredSizeWidget? | null | Bottom widget |

**GAppBarVariant Enum:**
- `surface`, `primary`, `transparent`

---

#### GBottomNav

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `items` | List<GBottomNavItem> | required | Nav items |
| `currentIndex` | int | 0 | Selected index |
| `onTap` | ValueChanged<int>? | null | Tap handler |
| `variant` | GBottomNavVariant | surface | Nav style |
| `showLabels` | bool | true | Show labels |

---

#### GTabBar

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `tabs` | List<GTab> | required | Tab items |
| `controller` | TabController? | null | Tab controller |
| `variant` | GTabBarVariant | primary | Tab bar style |
| `isScrollable` | bool | false | Scrollable tabs |

**GTabBarVariant Enum:**
- `primary`, `secondary`, `pills`

---

#### GDrawer

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `header` | Widget? | null | Drawer header |
| `items` | List<GDrawerItem> | required | Drawer items |
| `footer` | Widget? | null | Drawer footer |
| `width` | double? | null | Drawer width |

---

#### GBreadcrumb

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `items` | List<GBreadcrumbItem> | required | Breadcrumb items |
| `separator` | Widget? | null | Custom separator |
| `maxItems` | int? | null | Max visible items |

---

#### GPagination

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `currentPage` | int | required | Current page |
| `totalPages` | int | required | Total pages |
| `onPageChanged` | ValueChanged<int>? | null | Page handler |
| `siblingCount` | int | 1 | Siblings to show |
| `showFirstLast` | bool | true | Show first/last |

---

#### GStepper

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `steps` | List<GStep> | required | Step items |
| `currentStep` | int | 0 | Current step |
| `onStepTapped` | ValueChanged<int>? | null | Tap handler |
| `variant` | GStepperVariant | horizontal | Stepper layout |

**GStepperVariant Enum:**
- `horizontal`, `vertical`

---

#### GLink

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `text` | String | required | Link text |
| `onTap` | VoidCallback? | null | Tap handler |
| `href` | String? | null | URL |
| `variant` | GLinkVariant | primary | Link style |
| `isExternal` | bool | false | External link |

---

### Layout Components

#### GCard

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `child` | Widget | required | Card content |
| `variant` | GCardVariant | elevated | Card style |
| `padding` | EdgeInsets? | null | Content padding |
| `onTap` | VoidCallback? | null | Tap handler |
| `borderRadius` | BorderRadius? | null | Corner radius |

**GCardVariant Enum:**
- `elevated`, `filled`, `outlined`

---

#### GContainer

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `child` | Widget? | null | Container content |
| `width` | double? | null | Container width |
| `height` | double? | null | Container height |
| `padding` | EdgeInsets? | null | Inner padding |
| `margin` | EdgeInsets? | null | Outer margin |
| `color` | Color? | null | Background color |
| `borderRadius` | BorderRadius? | null | Corner radius |
| `border` | Border? | null | Border style |
| `shadow` | BoxShadow? | null | Box shadow |

---

#### GGrid

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `children` | List<Widget> | required | Grid items |
| `columns` | int | 2 | Column count |
| `spacing` | double | 16 | Item spacing |
| `runSpacing` | double | 16 | Row spacing |
| `crossAxisAlignment` | CrossAxisAlignment | start | Cross alignment |

---

#### GSpacer

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `size` | GSpacerSize | medium | Spacer size |
| `axis` | Axis | vertical | Spacer direction |

---

#### GGap

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `size` | double | required | Gap size |

Convenience constructors:
- `GGap.xs()`, `GGap.sm()`, `GGap.md()`, `GGap.lg()`, `GGap.xl()`

---

#### GResponsive

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `xs` | Widget? | null | Extra small layout |
| `sm` | Widget? | null | Small layout |
| `md` | Widget? | null | Medium layout |
| `lg` | Widget? | null | Large layout |
| `xl` | Widget? | null | Extra large layout |

---

#### GScaffold

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `appBar` | GAppBar? | null | App bar |
| `body` | Widget? | null | Body content |
| `bottomNav` | GBottomNav? | null | Bottom navigation |
| `drawer` | GDrawer? | null | Side drawer |
| `floatingActionButton` | Widget? | null | FAB |
| `backgroundColor` | Color? | null | Background color |

---

#### GListTile

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `title` | String | required | Title text |
| `subtitle` | String? | null | Subtitle text |
| `leading` | Widget? | null | Leading widget |
| `trailing` | Widget? | null | Trailing widget |
| `onTap` | VoidCallback? | null | Tap handler |
| `isSelected` | bool | false | Selected state |
| `isDisabled` | bool | false | Disabled state |

---

#### GExpansionTile

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `title` | String | required | Title text |
| `subtitle` | String? | null | Subtitle text |
| `children` | List<Widget> | required | Expanded content |
| `leading` | Widget? | null | Leading widget |
| `initiallyExpanded` | bool | false | Initial state |
| `onExpansionChanged` | ValueChanged<bool>? | null | Expansion handler |

---

#### GAccordion

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `items` | List<GAccordionItem> | required | Accordion items |
| `allowMultiple` | bool | false | Allow multiple open |

---

### Overlay Components

#### GDialog

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `title` | String? | null | Dialog title |
| `content` | Widget? | null | Dialog content |
| `actions` | List<Widget>? | null | Action buttons |
| `isDismissible` | bool | true | Dismiss on tap outside |
| `icon` | IconData? | null | Header icon |

Static methods:
- `GDialog.show(context, builder)`
- `GDialog.confirm(context, title, message, onConfirm)`
- `GDialog.alert(context, title, message)`

---

#### GModal

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `child` | Widget | required | Modal content |
| `title` | String? | null | Modal title |
| `isDismissible` | bool | true | Dismiss on tap outside |
| `showCloseButton` | bool | true | Show close button |
| `size` | GModalSize | medium | Modal size |

**GModalSize Enum:**
- `sm`, `md`, `lg`, `xl`, `fullscreen`

---

#### GBottomSheet

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `child` | Widget | required | Sheet content |
| `title` | String? | null | Sheet title |
| `isDismissible` | bool | true | Dismiss on drag/tap |
| `showDragHandle` | bool | true | Show drag handle |
| `isScrollable` | bool | true | Scrollable content |
| `initialHeight` | double? | null | Initial height |
| `maxHeight` | double? | null | Max height |

---

#### GPopupMenu

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `items` | List<GPopupMenuItem> | required | Menu items |
| `child` | Widget | required | Trigger widget |
| `onSelected` | ValueChanged<T>? | null | Selection handler |
| `offset` | Offset? | null | Menu offset |

---

## Utilities

### Extensions

#### BuildContext Extensions (`context_ext.dart`)

```dart
context.theme        // GThemeData
context.colors       // GColorScheme
context.textTheme    // GTextTheme
context.spacing      // GSpacing accessor
context.isDarkMode   // bool
context.screenWidth  // double
context.screenHeight // double
context.isXs         // bool
context.isSm         // bool
context.isMd         // bool
context.isLg         // bool
context.isXl         // bool
```

#### Color Extensions (`color_ext.dart`)

```dart
color.withOpacity(GOpacity.50)
color.lighten(0.1)
color.darken(0.1)
color.toHex()
color.isLight
color.isDark
color.contrastWith(other)
```

#### TextStyle Extensions (`text_style_ext.dart`)

```dart
style.withColor(color)
style.withWeight(GFontWeight.bold)
style.withSize(GFontSize.lg)
style.italic
style.underline
style.lineThrough
```

#### Widget Extensions (`widget_ext.dart`)

```dart
widget.padding(GSpacing.md)
widget.paddingAll(16)
widget.paddingSymmetric(h: 16, v: 8)
widget.paddingOnly(left: 16)
widget.margin(GSpacing.md)
widget.center()
widget.expanded(flex: 1)
widget.flexible(flex: 1)
widget.opacity(0.5)
widget.visible(condition)
widget.aspectRatio(16/9)
widget.clipRRect(radius)
widget.onTap(callback)
widget.tooltip(message)
```

#### Number Extensions (`num_ext.dart`)

```dart
16.w              // Width
16.h              // Height
16.sp             // Font size
16.r              // Radius
16.horizontalSpace // SizedBox(width: 16)
16.verticalSpace   // SizedBox(height: 16)
```

---

### Helpers

#### Responsive Helper (`responsive.dart`)

```dart
GResponsiveValue<T>({
  T xs,
  T? sm,
  T? md,
  T? lg,
  T? xl,
}).resolve(context)

GBreakpointBuilder(
  builder: (context, breakpoint) => Widget,
)
```

#### Platform Helper (`platform.dart`)

```dart
GPlatform.isAndroid
GPlatform.isIOS
GPlatform.isWeb
GPlatform.isDesktop
GPlatform.isMobile
GPlatform.isWindows
GPlatform.isMacOS
GPlatform.isLinux
```

#### Contrast Helper (`contrast.dart`)

```dart
GContrast.ratio(color1, color2)
GContrast.isAccessible(foreground, background)
GContrast.suggestForeground(background)
```

---

### Accessibility

#### Semantics Helper (`semantics.dart`)

```dart
widget.semanticLabel(label)
widget.semanticButton(label, onTap)
widget.semanticHeading(level)
widget.excludeSemantics()
widget.mergeSemantics()
```

#### Focus Helper (`focus.dart`)

```dart
GFocusScope(child: widget)
GFocusTraversalGroup(children: widgets)
widget.autofocus()
widget.focusable()
```

---

## Version History

| Version | Date | Description |
|---------|------|-------------|
| 0.0.1 | TBD | Initial release with foundations |
| 0.1.0 | TBD | Core input components |
| 0.2.0 | TBD | Display components |
| 0.3.0 | TBD | Navigation & Layout |
| 0.4.0 | TBD | Overlay & Feedback |
| 1.0.0 | TBD | Stable release |

