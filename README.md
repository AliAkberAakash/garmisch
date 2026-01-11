# Garmisch Design System

A minimalistic design system based on Material Design for Flutter applications.

## Overview

Garmisch provides a comprehensive set of design tokens, themed components, and utilities for building consistent, accessible, and maintainable Flutter applications. It features a 3-tier color architecture, responsive breakpoints, and a rich component library.

## Features

- **🎨 Design Tokens** — Colors, typography, spacing, sizing, shadows, and more
- **🌓 Theming** — Built-in light/dark modes with customizable color schemes
- **📱 Responsive** — Breakpoint-aware layouts and responsive utilities
- **♿ Accessible** — WCAG-compliant contrast helpers and semantic utilities
- **🧩 50+ Components** — Inputs, display, feedback, navigation, layout, and overlay

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  garmisch: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## Quick Start

### 1. Wrap Your App with GTheme

```dart
import 'package:garmisch/garmisch.dart';

void main() {
  runApp(
    GTheme(
      data: GThemeData.light(),
      child: MyApp(),
    ),
  );
}
```

### 2. Access Theme Values

```dart
// Get colors
final primaryColor = context.gColors.primary;

// Get text styles
final headlineStyle = context.gTextTheme.headlineLarge;

// Check screen size
if (context.isMobile) {
  // Mobile layout
}
```

### 3. Use Components

```dart
GButton(
  label: 'Submit',
  variant: GButtonVariant.primary,
  onPressed: () {},
)

GTextField(
  label: 'Email',
  hint: 'Enter your email',
  prefixIcon: Icons.email,
)
```

---

## Architecture

### File Structure

```
lib/
├── garmisch.dart              # Main barrel export
└── src/
    ├── foundations/           # Design tokens
    ├── theme/                 # Theme system
    ├── components/            # UI components
    └── utilities/             # Extensions & helpers
```

### 3-Tier Color Architecture

```
Tier 1: Reference Colors (GColors)
    └── Raw color primitives (GColors.blue500, GColors.gray900)
         ↓
Tier 2: System Colors (GSystemColors)
    └── Semantic aliases (brand.primary, feedback.error)
         ↓
Tier 3: Color Scheme (GColorScheme)
    └── Light/dark mode tokens used by components
```

---

## Design Tokens (Foundations)

### Colors (`GColors`)

18 color scales (50-950) + base colors:

| Scale | Values |
|-------|--------|
| `gray`, `red`, `orange`, `amber`, `yellow`, `lime`, `green`, `emerald`, `teal`, `cyan`, `sky`, `blue`, `indigo`, `violet`, `purple`, `fuchsia`, `pink`, `rose` | 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950 |
| `white`, `black`, `transparent` | Base colors |

```dart
GColors.blue500  // Primary blue
GColors.gray100  // Light gray
```

### Spacing (`GSpacing`)

| Token | Value |
|-------|-------|
| `none` | 0 |
| `px` | 1px |
| `xs4` / `xs3` / `xs2` / `xs` | 2 / 4 / 6 / 8px |
| `sm` / `md` / `lg` | 12 / 16 / 20px |
| `xl` / `xl2` / `xl3` / `xl4` | 24 / 32 / 40 / 48px |
| `xl5` to `xl12` | 56px to 160px |

### Typography (`GTypography`)

**Font Sizes:**
| Token | Size |
|-------|------|
| `fontSizeXs` / `fontSizeSm` / `fontSizeBase` | 12 / 14 / 16px |
| `fontSizeLg` / `fontSizeXl` | 18 / 20px |
| `fontSizeXl2` to `fontSizeXl9` | 24px to 128px |

**Font Weights:**
`thin` (100), `extraLight` (200), `light` (300), `regular` (400), `medium` (500), `semiBold` (600), `bold` (700), `extraBold` (800), `black` (900)

### Border Radius (`GBorderRadius`)

| Token | Value |
|-------|-------|
| `none` / `xs` / `sm` / `md` | 0 / 2 / 4 / 6px |
| `lg` / `xl` / `xl2` / `xl3` / `xl4` | 8 / 12 / 16 / 24 / 32px |
| `full` | 9999px (pill) |

### Shadows (`GShadows`)

`none`, `xs`, `sm`, `md`, `lg`, `xl`, `xl2`, `inner`

### Breakpoints (`GBreakpoints`)

| Token | Value | Description |
|-------|-------|-------------|
| `xs` | 0px | Phones portrait |
| `sm` | 576px | Phones landscape |
| `md` | 768px | Tablets |
| `lg` | 992px | Desktops |
| `xl` | 1200px | Large desktops |
| `xl2` | 1400px | Wide screens |

### Durations (`GDurations`)

| Token | Value |
|-------|-------|
| `instant` | 0ms |
| `fastest` / `faster` / `fast` | 50 / 100 / 150ms |
| `normal` / `slow` / `slower` / `slowest` | 200 / 300 / 400 / 500ms |

### Easing (`GEasing`)

`linear`, `easeIn`, `easeOut`, `easeInOut`, `easeInSine`, `easeOutSine`, `easeInOutSine`, `easeInQuad`, `easeOutQuad`, `easeInOutQuad`, `easeInCubic`, `easeOutCubic`, `easeInOutCubic`, `easeInBack`, `easeOutBack`, `easeInOutBack`, `spring`

### Opacity (`GOpacity`)

`transparent` (0), `5`, `10`, `20`, `25`, `30`, `40`, `50`, `60`, `70`, `75`, `80`, `90`, `95`, `opaque` (1.0)

---

## Components

### Input Components

| Component | Description | Variants |
|-----------|-------------|----------|
| `GButton` | Clickable button | `primary`, `secondary`, `tertiary`, `outlined`, `ghost`, `destructive`, `link` |
| `GTextField` | Text input field | `outlined`, `filled`, `underlined` |
| `GCheckbox` | Checkbox with label | - |
| `GRadio<T>` | Radio button group | - |
| `GSwitch` | Toggle switch | - |
| `GSlider` | Range slider | - |
| `GDropdown<T>` | Dropdown select | `outlined`, `filled` |
| `GSearchField` | Search input | - |

### Display Components

| Component | Description |
|-----------|-------------|
| `GText` | Styled text with theme tokens |
| `GAvatar` | User avatar (image/initials/icon) |
| `GBadge` | Status badge with count |
| `GChip` | Selectable/deletable chip |
| `GTag` | Label tag |
| `GDivider` | Horizontal/vertical divider |
| `GImage` | Image with loading/error states |
| `GProgressBar` | Linear progress indicator |
| `GProgressCircle` | Circular progress indicator |
| `GSkeleton` | Loading placeholder |
| `GTooltip` | Hover tooltip |

### Feedback Components

| Component | Description |
|-----------|-------------|
| `GAlert` | Inline alert message |
| `GToast` | Temporary notification |
| `GBanner` | Full-width banner |
| `GEmptyState` | Empty state illustration |

### Navigation Components

| Component | Description |
|-----------|-------------|
| `GAppBar` | Top app bar |
| `GDrawer` | Side navigation drawer |
| `GBreadcrumb` | Breadcrumb navigation |

### Layout Components

| Component | Description |
|-----------|-------------|
| `GCard` | Content card container |
| `GContainer` | Flexible container |
| `GGrid` | Grid layout |
| `GStack` | Stack/overlay layout |
| `GListTile` | List item |
| `GAccordion` | Collapsible sections |

### Overlay Components

| Component | Description |
|-----------|-------------|
| `GDialog` | Modal dialog |
| `GBottomSheet` | Bottom sheet |
| `GPopupMenu` | Context menu |
| `GPopover` | Popover overlay |

---

## Theme System

### GThemeData

```dart
// Light theme
GThemeData.light()

// Dark theme
GThemeData.dark()

// From brightness
GThemeData.fromBrightness(brightness: Brightness.dark)

// Custom theme
GThemeData(
  colors: GColorScheme.light(systemColors: customSystemColors),
  textTheme: GTextTheme.standard(fontFamily: 'CustomFont'),
)
```

### Color Scheme Tokens

| Token | Description |
|-------|-------------|
| `primary`, `onPrimary`, `primaryContainer`, `onPrimaryContainer` | Primary brand colors |
| `secondary`, `onSecondary`, `secondaryContainer`, `onSecondaryContainer` | Secondary colors |
| `tertiary`, `onTertiary`, `tertiaryContainer`, `onTertiaryContainer` | Accent colors |
| `error`, `warning`, `success`, `info` + `on*` + `*Container` variants | Feedback colors |
| `background`, `onBackground` | Page background |
| `surface`, `onSurface`, `surfaceVariant`, `onSurfaceVariant` | Surface colors |
| `outline`, `outlineVariant` | Border colors |
| `disabled`, `onDisabled` | Disabled states |

### Text Theme Tokens

| Token | Size | Weight | Use Case |
|-------|------|--------|----------|
| `displayLarge` / `displayMedium` / `displaySmall` | 72 / 60 / 48px | regular | Hero text |
| `headlineLarge` / `headlineMedium` / `headlineSmall` | 36 / 30 / 24px | semiBold | Titles |
| `titleLarge` / `titleMedium` / `titleSmall` | 20 / 16 / 14px | medium | Subtitles |
| `labelLarge` / `labelMedium` / `labelSmall` | 14 / 12 / 12px | semiBold/medium | Labels |
| `bodyLarge` / `bodyMedium` / `bodySmall` | 16 / 14 / 12px | regular | Body text |

---

## Utilities

### Context Extensions

```dart
// Theme & Colors
context.gTheme        // GThemeData
context.gColors       // GColorScheme
context.gTextTheme    // GTextTheme
context.isDarkMode    // bool

// Design Tokens (via theme)
context.gSpacing      // GSpacingTokens - context.gSpacing.md
context.gSizing       // GSizingTokens - context.gSizing.xl
context.gBorderRadius // GBorderRadiusTokens - context.gBorderRadius.lg
context.gBorderWidth  // GBorderWidthTokens - context.gBorderWidth.thin
context.gShadows      // GShadowTokens - context.gShadows.md
context.gDurations    // GDurationTokens - context.gDurations.normal
context.gEasing       // GEasingTokens - context.gEasing.easeOut
context.gOpacity      // GOpacityTokens - context.gOpacity.o50
context.gBreakpoints  // GBreakpointTokens - context.gBreakpoints.md

// Screen Info
context.screenWidth   // double
context.screenHeight  // double
context.isMobile      // bool (< 768px)
context.isTablet      // bool (768-992px)
context.isDesktop     // bool (>= 992px)
context.isXs / isSm / isMd / isLg / isXl / isXl2  // Breakpoint checks
```

### Widget Extensions

```dart
widget.padding(GSpacing.md)         // Static access
widget.padding(context.gSpacing.md) // Theme-aware access (uses generated tokens if available)
widget.margin(GSpacing.sm)
widget.center()
widget.expanded()
widget.visible(condition)
widget.onTap(callback)
widget.tooltip(message)
```

### Color Extensions

```dart
color.withOpacity(GOpacity.50)
color.lighten(0.1)
color.darken(0.1)
color.toHex()
color.isLight / isDark
```

---

## For Detailed Reference

See [DESIGN_SYSTEM.md](./DESIGN_SYSTEM.md) for complete API documentation including:
- All component properties and types
- Enum values for all variants
- Custom theming with JSON
- Migration notes

---

## Using This README with AI Agents

This README is structured to help AI coding assistants understand and use the Garmisch design system effectively.

### AI Agent Instructions

When working with this codebase, AI agents should:

1. **Import the package:**
   ```dart
   import 'package:garmisch/garmisch.dart';
   ```

2. **Use design tokens instead of raw values:**
   ```dart
   // ✅ Correct
   padding: EdgeInsets.all(GSpacing.md),
   color: GColors.blue500,
   
   // ❌ Avoid
   padding: EdgeInsets.all(16),
   color: Color(0xFF3B82F6),
   ```

3. **Access theme via context:**
   ```dart
   final colors = context.gColors;
   final textTheme = context.gTextTheme;
   ```

4. **Use G-prefixed components:**
   ```dart
   GButton, GTextField, GCard, GAlert, etc.
   ```

5. **Check responsive breakpoints:**
   ```dart
   if (context.isMobile) { /* mobile layout */ }
   if (context.isDesktop) { /* desktop layout */ }
   ```

### Key Files for AI Reference

| File | Purpose |
|------|---------|
| `lib/garmisch.dart` | Main export, usage examples |
| `DESIGN_SYSTEM.md` | Complete API documentation |
| `lib/src/foundations/` | All design tokens |
| `lib/src/components/` | All UI components |
| `lib/src/theme/` | Theme system |
| `lib/src/utilities/` | Extensions & helpers |

### Prompt Template for AI Agents

```
When generating Flutter code for this project:
- Use Garmisch design system components (GButton, GTextField, GCard, etc.)
- Apply design tokens: GSpacing, GColors, GTypography, GBorderRadius
- Access theme via context: context.gColors, context.gTextTheme
- Use responsive helpers: context.isMobile, context.isDesktop
- Refer to DESIGN_SYSTEM.md for complete component APIs
```

---

## Custom Design Tokens

Garmisch includes a CLI tool that generates custom design tokens from DTCG (Design Tokens Community Group) format JSON files. The generator creates ready-to-use Dart classes including a `GeneratedTheme` class that wires everything together automatically.

### Quick Start

1. **Copy the default tokens file** to your project:

```bash
# From the garmisch package
cp path/to/garmisch/tokens/design-tokens.json ./design-tokens.json
```

2. **Customize the tokens** in `design-tokens.json`:

```json
{
  "color": {
    "blue": {
      "500": { "$type": "color", "$value": "#6366F1" }
    }
  },
  "fontFamily": {
    "sans": { "$type": "fontFamily", "$value": "Poppins" }
  }
}
```

3. **Run the generator**:

```bash
dart run garmisch:generate_tokens --input design-tokens.json --output lib/generated/
```

4. **Use the generated theme** (zero configuration):

```dart
import 'package:garmisch/garmisch.dart';
import 'package:your_app/generated/generated.dart';

void main() {
  runApp(
    GTheme(
      data: GeneratedTheme.light(), // That's it!
      child: MyApp(),
    ),
  );
}
```

### Generated Files

The generator creates 12 files:

| File | Description |
|------|-------------|
| `colors.g.dart` | `GColors` class with all color tokens |
| `spacing.g.dart` | `GSpacing` class |
| `sizing.g.dart` | `GSizing` class |
| `typography.g.dart` | `GTypography` with fonts, sizes, weights |
| `border_radius.g.dart` | `GBorderRadius` class |
| `shadows.g.dart` | `GShadows` class |
| `durations.g.dart` | `GDurations` class |
| `easing.g.dart` | `GEasing` curves |
| `opacity.g.dart` | `GOpacity` class |
| `breakpoints.g.dart` | `GBreakpoints` class |
| `theme_integration.g.dart` | `GeneratedTheme` with `light()`, `dark()`, `fromBrightness()` |
| `generated.dart` | Barrel export for all files |

### GeneratedTheme API

```dart
// Light theme with generated tokens
GeneratedTheme.light()

// Dark theme with generated tokens
GeneratedTheme.dark()

// Follow system brightness
GeneratedTheme.fromBrightness(
  brightness: MediaQuery.platformBrightnessOf(context),
)

// Override specific parts
GeneratedTheme.light(
  fontFamily: 'CustomFont',
  systemColors: myCustomSystemColors,
)
```

### CLI Options

```bash
dart run garmisch:generate_tokens [options]

Options:
  --input, -i <path>    Path to design tokens JSON (default: design-tokens.json)
  --output, -o <path>   Output directory (default: lib/generated/)
  --help, -h            Show help message
```

### Custom Fonts

1. **Define fonts in your tokens**:

```json
{
  "fontFamily": {
    "sans": { "$type": "fontFamily", "$value": "Poppins" },
    "serif": { "$type": "fontFamily", "$value": "Merriweather" }
  },
  "fontFamilyFallback": {
    "sans": { "$type": "fontFamily", "$value": ["system-ui", "sans-serif"] }
  }
}
```

2. **Add font files** to your project and register in `pubspec.yaml`:

```yaml
flutter:
  fonts:
    - family: Poppins
      fonts:
        - asset: fonts/Poppins-Regular.ttf
        - asset: fonts/Poppins-Bold.ttf
          weight: 700
```

3. **The generated theme automatically uses your fonts**:

```dart
// GTypography.fontFamilySans is now "Poppins"
GeneratedTheme.light() // Uses Poppins automatically
```

### DTCG Format Reference

The generator follows the [Design Tokens Community Group format](https://tr.designtokens.org/format/):

```json
{
  "category": {
    "token-name": {
      "$type": "color|dimension|duration|cubicBezier|shadow|fontFamily|fontWeight|number",
      "$value": "<value>",
      "$description": "Optional description"
    }
  }
}
```

### Token Aliases

Use aliases to reference other tokens (preserved as Dart references for tree-shaking):

```json
{
  "color": {
    "primary": { "$type": "color", "$value": "{color.blue.500}" }
  }
}
```

Generates:
```dart
static const Color primary = GColors.blue500;
```

---

## Example App

See the `/example` folder for a complete showcase app demonstrating all components and tokens.

```bash
cd example
flutter run
```

---

## License

MIT License - see [LICENSE](./LICENSE) for details.
