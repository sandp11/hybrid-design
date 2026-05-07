import 'package:flutter/material.dart';
import 'package:acko_flutter/acko_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openDsBreadcrumbUri(BuildContext context, Uri uri) async {
  if (uri.scheme == 'http' || uri.scheme == 'https') {
    await launchUrl(uri, mode: LaunchMode.platformDefault);
    return;
  }
  if (!context.mounted) return;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Breadcrumb link: $uri')),
  );
}

void main() {
  runApp(const FlutterDsPreviewApp());
}

class FlutterDsPreviewApp extends StatefulWidget {
  const FlutterDsPreviewApp({super.key});

  @override
  State<FlutterDsPreviewApp> createState() => _FlutterDsPreviewAppState();
}

class _FlutterDsPreviewAppState extends State<FlutterDsPreviewApp> {
  ThemeMode _mode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'acko_flutter — Components',
      debugShowCheckedModeBanner: false,
      themeMode: _mode,
      theme: _lightTheme(),
      darkTheme: _darkTheme(),
      home: ComponentsPreviewPage(
        themeMode: _mode,
        onToggleTheme: () {
          setState(() {
            _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
          });
        },
      ),
    );
  }

  ThemeData _lightTheme() {
    const ds = DsThemeExtension.light;
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: ds.colorSurface,
      colorScheme: ColorScheme.light(
        surface: ds.colorSurface,
        onSurface: ds.colorTextDefault,
        primary: ds.colorPrimary,
        onPrimary: ds.colorOnPrimary,
      ),
      extensions: [
        DsThemeExtension.light,
        DsButtonTheme.defaults,
        DsBadgeTheme.light,
        DsAvatarTheme.light,
        DsAlertTheme.light,
        DsCheckboxTheme.light,
        DsAccordionTheme.light,
        DsBreadcrumbTheme.light,
        DsCalendarTheme.defaults,
        DsCardTheme.defaults,
        DsDialogTheme.light,
        DsDrawerTheme.light,
      ],
    );
  }

  ThemeData _darkTheme() {
    const ds = DsThemeExtension.dark;
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ds.colorSurface,
      colorScheme: ColorScheme.dark(
        surface: ds.colorSurface,
        onSurface: ds.colorTextDefault,
        primary: ds.colorPrimary,
        onPrimary: ds.colorOnPrimary,
      ),
      extensions: [
        DsThemeExtension.dark,
        DsButtonTheme.defaults,
        DsBadgeTheme.dark,
        DsAvatarTheme.dark,
        DsAlertTheme.dark,
        DsCheckboxTheme.dark,
        DsAccordionTheme.dark,
        DsBreadcrumbTheme.dark,
        DsCalendarTheme.defaults,
        DsCardTheme.defaults,
        DsDialogTheme.dark,
        DsDrawerTheme.dark,
      ],
    );
  }
}

class ComponentsPreviewPage extends StatelessWidget {
  const ComponentsPreviewPage({
    super.key,
    required this.themeMode,
    required this.onToggleTheme,
  });

  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    final ds = Theme.of(context).extension<DsThemeExtension>();
    final titleStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
          color: ds?.colorTextPrimary,
          fontWeight: FontWeight.w600,
        );
    final labelStyle = Theme.of(context).textTheme.titleSmall?.copyWith(
          color: ds?.colorTextSecondary,
          fontWeight: FontWeight.w600,
        );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ds?.colorSurfaceRaised,
        foregroundColor: ds?.colorTextPrimary,
        elevation: 0,
        title: const Text('Components'),
        actions: [
          IconButton(
            tooltip: themeMode == ThemeMode.light ? 'Dark theme' : 'Light theme',
            onPressed: onToggleTheme,
            icon: Icon(
              themeMode == ThemeMode.light ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          // ── Button ──────────────────────────────────────────────────────
          Text('Button', style: titleStyle),
          const SizedBox(height: 4),
          Text('Variants', style: labelStyle),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              for (final v in DsButtonVariant.values)
                DsButton(
                  label: v.name,
                  variant: v,
                  onPressed: () {},
                ),
            ],
          ),
          const SizedBox(height: 28),
          Text('Sizes (primary)', style: labelStyle),
          const SizedBox(height: 12),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: [
              for (final s in DsButtonSize.values)
                DsButton(
                  label: s.name,
                  size: s,
                  onPressed: () {},
                ),
            ],
          ),
          const SizedBox(height: 28),
          Text('Icons', style: labelStyle),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              DsButton(
                label: 'Left icon',
                iconLeft: const Icon(Icons.add, size: 18),
                onPressed: () {},
              ),
              DsButton(
                label: 'Right icon',
                iconRight: const Icon(Icons.arrow_forward, size: 18),
                onPressed: () {},
              ),
              DsButton(
                label: 'Add',
                iconOnly: true,
                iconLeft: const Icon(Icons.add, size: 20),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 28),
          Text('States', style: labelStyle),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: const [
              DsButton(
                label: 'Loading',
                isLoading: true,
                onPressed: null,
              ),
              DsButton(
                label: 'Disabled',
                onPressed: null,
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: DsButton(
              label: 'Full width',
              fullWidth: true,
              onPressed: () {},
            ),
          ),

          // ── Avatar ───────────────────────────────────────────────────────
          const SizedBox(height: 32),
          Text('Avatar', style: titleStyle),
          const SizedBox(height: 12),

          Text('Sizes', style: labelStyle),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: [
              for (final s in DsAvatarSize.values)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DsAvatar(
                      initials: 'DS',
                      size: s,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      s.name,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: ds?.colorTextSecondary,
                          ),
                    ),
                  ],
                ),
            ],
          ),

          const SizedBox(height: 20),
          Text('Shapes', style: labelStyle),
          const SizedBox(height: 8),
          Wrap(
            spacing: 16,
            runSpacing: 12,
            children: [
              DsAvatar(initials: 'CI', shape: DsAvatarShape.circle),
              DsAvatar(initials: 'SQ', shape: DsAvatarShape.square),
            ],
          ),

          const SizedBox(height: 20),
          Text('Photo', style: labelStyle),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerLeft,
            child: DsAvatar(
              src: 'https://picsum.photos/seed/flutter-ds-avatar/128/128',
              alt: 'Sample profile photo',
              size: DsAvatarSize.md,
            ),
          ),

          const SizedBox(height: 20),
          Text('Fallback', style: labelStyle),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerLeft,
            child: DsAvatar(
              size: DsAvatarSize.md,
            ),
          ),

          // ── Alert ───────────────────────────────────────────────────────
          const SizedBox(height: 32),
          Text('Alert', style: titleStyle),
          const SizedBox(height: 12),
          Text('Variants', style: labelStyle),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final v in DsAlertVariant.values)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: DsAlert(
                    variant: v,
                    title: v.name,
                    dismissible: true,
                    onDismiss: () {},
                    child: Text(
                      'Example ${v.name} alert body text.',
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20),
          Text('Body only', style: labelStyle),
          const SizedBox(height: 8),
          DsAlert(
            variant: DsAlertVariant.success,
            dismissible: false,
            child: Text(
              'Alert without a title row — caption-style body only.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ds?.colorTextDefault,
                  ),
            ),
          ),

          // ── Checkbox ───────────────────────────────────────────────────
          const SizedBox(height: 32),
          Text('Checkbox', style: titleStyle),
          const SizedBox(height: 12),
          CheckboxPreviewSection(labelStyle: labelStyle),

          // ── Accordion ──────────────────────────────────────────────────
          const SizedBox(height: 32),
          Text('Accordion', style: titleStyle),
          const SizedBox(height: 12),
          Text('Single (only one open)', style: labelStyle),
          const SizedBox(height: 8),
          DsAccordion(
            type: DsAccordionType.single,
            defaultValue: const ['details'],
            items: const [
              DsAccordionItem(
                value: 'details',
                trigger: Text('Policy details'),
                content: Text(
                  'Supplementary information about your plan. This section uses body text styling.',
                ),
              ),
              DsAccordionItem(
                value: 'claims',
                trigger: Text('Claims process'),
                content: Text('How to file a claim and what documents you need.'),
              ),
              DsAccordionItem(
                value: 'disabled',
                trigger: Text('Disabled item'),
                content: Text('This content is not reachable when disabled.'),
                disabled: true,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text('Multiple (independent panels)', style: labelStyle),
          const SizedBox(height: 8),
          DsAccordion(
            type: DsAccordionType.multiple,
            defaultValue: const ['a'],
            items: const [
              DsAccordionItem(
                value: 'a',
                trigger: Text('Section A'),
                content: Text('You can open A and B at the same time.'),
              ),
              DsAccordionItem(
                value: 'b',
                trigger: Text('Section B'),
                content: Text('Multiple mode does not use the collapsible flag.'),
              ),
            ],
          ),

          // ── Breadcrumb ───────────────────────────────────────────────────
          const SizedBox(height: 32),
          Text('Breadcrumb', style: titleStyle),
          const SizedBox(height: 12),
          BreadcrumbPreviewSection(labelStyle: labelStyle),

          // ── Card ────────────────────────────────────────────────────────
          const SizedBox(height: 32),
          Text('Card', style: titleStyle),
          const SizedBox(height: 12),
          CardPreviewSection(labelStyle: labelStyle),

          // ── Dialog (modal) ───────────────────────────────────────────────
          const SizedBox(height: 32),
          Text('Dialog', style: titleStyle),
          const SizedBox(height: 12),
          DialogPreviewSection(labelStyle: labelStyle),

          // ── Drawer ───────────────────────────────────────────────────────
          const SizedBox(height: 32),
          Text('Drawer', style: titleStyle),
          const SizedBox(height: 12),
          DrawerPreviewSection(labelStyle: labelStyle),

          // ── Calendar ─────────────────────────────────────────────────────
          const SizedBox(height: 32),
          Text('Calendar', style: titleStyle),
          const SizedBox(height: 12),
          CalendarPreviewSection(labelStyle: labelStyle),

          // ── Badge ───────────────────────────────────────────────────────
          const SizedBox(height: 32),
          Text('Badge', style: titleStyle),
          const SizedBox(height: 12),

          Text('Colors — Solid', style: labelStyle),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final c in DsBadgeColor.values)
                DsBadge(label: c.name, color: c),
            ],
          ),

          const SizedBox(height: 20),
          Text('Colors — Outline', style: labelStyle),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final c in DsBadgeColor.values)
                DsBadge(label: c.name, color: c, variant: DsBadgeVariant.outline),
            ],
          ),

          const SizedBox(height: 20),
          Text('Dot variant', style: labelStyle),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final c in DsBadgeColor.values)
                DsBadge(label: c.name, color: c, variant: DsBadgeVariant.dot),
            ],
          ),

          const SizedBox(height: 20),
          Text('Sentence case', style: labelStyle),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final c in DsBadgeColor.values)
                DsBadge(label: c.name, color: c, textCase: DsBadgeTextCase.sentence),
            ],
          ),

          const SizedBox(height: 20),
          Text('Removable', style: labelStyle),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final c in DsBadgeColor.values)
                DsBadge(label: c.name, color: c, removable: true, onRemove: () {}),
            ],
          ),

          const SizedBox(height: 20),
          Text('Counter Badge', style: labelStyle),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              DsCounterBadge(count: 1,   color: DsCounterBadgeColor.purple),
              DsCounterBadge(count: 9,   color: DsCounterBadgeColor.pink),
              DsCounterBadge(count: 42,  color: DsCounterBadgeColor.blue),
              DsCounterBadge(count: 999, max: 99, color: DsCounterBadgeColor.purple),
            ],
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

/// Breadcrumb previews — links, plain segments, icons, ellipsis collapse.
class BreadcrumbPreviewSection extends StatelessWidget {
  const BreadcrumbPreviewSection({super.key, required this.labelStyle});

  final TextStyle? labelStyle;

  static List<DsBreadcrumbItem> _manyItems() => [
        const DsBreadcrumbItem(label: 'Home', href: 'https://flutter.dev'),
        const DsBreadcrumbItem(label: 'Level 1', href: '/l1'),
        const DsBreadcrumbItem(label: 'Level 2', href: '/l2'),
        const DsBreadcrumbItem(label: 'Level 3', href: '/l3'),
        const DsBreadcrumbItem(label: 'Level 4', href: '/l4'),
        const DsBreadcrumbItem(label: 'Level 5', href: '/l5'),
        const DsBreadcrumbItem(label: 'Level 6', href: '/l6'),
        const DsBreadcrumbItem(label: 'Current'),
      ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Standard trail', style: labelStyle),
        const SizedBox(height: 8),
        DsBreadcrumb(
          onLinkTap: (uri) => openDsBreadcrumbUri(context, uri),
          items: const [
            DsBreadcrumbItem(label: 'Home', href: '/'),
            DsBreadcrumbItem(label: 'Insurance', href: '/insurance'),
            DsBreadcrumbItem(label: 'Motor', href: '/motor'),
            DsBreadcrumbItem(
              label: 'Docs',
              href: 'https://docs.flutter.dev',
            ),
            DsBreadcrumbItem(label: 'Renewal'),
          ],
        ),
        const SizedBox(height: 20),
        Text('Plain segments', style: labelStyle),
        const SizedBox(height: 8),
        const DsBreadcrumb(
          items: [
            DsBreadcrumbItem(label: 'Org'),
            DsBreadcrumbItem(label: 'Team'),
            DsBreadcrumbItem(label: 'Project'),
          ],
        ),
        const SizedBox(height: 20),
        Text('With icon', style: labelStyle),
        const SizedBox(height: 8),
        DsBreadcrumb(
          onLinkTap: (uri) => openDsBreadcrumbUri(context, uri),
          items: [
            DsBreadcrumbItem(
              label: 'Home',
              href: '/',
              icon: const Icon(Icons.home_outlined, size: 14),
            ),
            const DsBreadcrumbItem(label: 'Policies', href: '/policies'),
            const DsBreadcrumbItem(label: 'Details'),
          ],
        ),
        const SizedBox(height: 20),
        Text('Collapsed (maxItems: 4)', style: labelStyle),
        const SizedBox(height: 8),
        DsBreadcrumb(
          onLinkTap: (uri) => openDsBreadcrumbUri(context, uri),
          items: _manyItems(),
          maxItems: 4,
        ),
      ],
    );
  }
}

/// Drawer previews — [showDsDrawer] per side + size ramp (matches Storybook).
class DrawerPreviewSection extends StatelessWidget {
  const DrawerPreviewSection({super.key, required this.labelStyle});

  final TextStyle? labelStyle;

  void _openDrawer(
    BuildContext context, {
    required DsDrawerSide side,
    DsDrawerSize size = DsDrawerSize.md,
  }) {
    showDsDrawer<void>(
      context: context,
      side: side,
      size: size,
      builder: (dialogContext) => DsDrawer(
        side: side,
        size: size,
        title: 'Drawer (${side.name} · ${size.name})',
        description: 'Slide-in panel — backdrop tap closes when dismissible.',
        body: Text(
          'Use for navigation rails, filters, or supplemental tasks without leaving the page.',
          style: Theme.of(dialogContext).textTheme.bodyMedium?.copyWith(
                color: Theme.of(dialogContext).extension<DsThemeExtension>()?.colorTextDefault,
              ),
        ),
        footer: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DsButton(
              label: 'Close',
              variant: DsButtonVariant.secondary,
              onPressed: () => Navigator.of(dialogContext).pop(),
            ),
            const SizedBox(width: 12),
            DsButton(
              label: 'Apply',
              variant: DsButtonVariant.primary,
              onPressed: () => Navigator.of(dialogContext).pop(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Edges · showDsDrawer', style: labelStyle),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            for (final s in DsDrawerSide.values)
              DsButton(
                label: s.name,
                variant: DsButtonVariant.secondary,
                onPressed: () => _openDrawer(context, side: s),
              ),
          ],
        ),
        const SizedBox(height: 20),
        Text('Widths (right · sm → full)', style: labelStyle),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            for (final z in DsDrawerSize.values)
              DsButton(
                label: z.name,
                variant: DsButtonVariant.secondary,
                onPressed: () => _openDrawer(
                  context,
                  side: DsDrawerSide.right,
                  size: z,
                ),
              ),
          ],
        ),
      ],
    );
  }
}

/// Dialog previews — [showDsDialog] with size ramp (matches React Storybook).
class DialogPreviewSection extends StatelessWidget {
  const DialogPreviewSection({super.key, required this.labelStyle});

  final TextStyle? labelStyle;

  void _openDialog(BuildContext context, DsDialogSize size) {
    showDsDialog<void>(
      context: context,
      builder: (dialogContext) => DsDialog(
        size: size,
        title: 'Dialog (${size.name})',
        description: 'Design-system modal — backdrop, elevation, and entrance motion.',
        body: Text(
          'Body slot accepts any widget tree. Long content scrolls inside the panel.',
          style: Theme.of(dialogContext).textTheme.bodyMedium?.copyWith(
                color: Theme.of(dialogContext).extension<DsThemeExtension>()?.colorTextDefault,
              ),
        ),
        footer: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DsButton(
              label: 'Cancel',
              variant: DsButtonVariant.secondary,
              onPressed: () => Navigator.of(dialogContext).pop(),
            ),
            const SizedBox(width: 12),
            DsButton(
              label: 'Confirm',
              variant: DsButtonVariant.primary,
              onPressed: () => Navigator.of(dialogContext).pop(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sizes · showDsDialog', style: labelStyle),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            for (final s in DsDialogSize.values)
              DsButton(
                label: s.name,
                variant: DsButtonVariant.secondary,
                onPressed: () => _openDialog(context, s),
              ),
          ],
        ),
      ],
    );
  }
}

/// Card previews — variants + compound layout (matches Storybook structure).
class CardPreviewSection extends StatelessWidget {
  const CardPreviewSection({super.key, required this.labelStyle});

  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    final ds = Theme.of(context).extension<DsThemeExtension>();
    final bodyStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: ds?.colorTextDefault,
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Variants', style: labelStyle),
        const SizedBox(height: 8),
        for (final v in DsCardVariant.values)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: DsCard(
              variant: v,
              padding: DsCardPadding.md,
              child: Text(
                v.name,
                style: bodyStyle,
              ),
            ),
          ),
        const SizedBox(height: 8),
        Text('Compound (header · inset · footer)', style: labelStyle),
        const SizedBox(height: 8),
        DsCard(
          variant: DsCardVariant.standard,
          padding: DsCardPadding.lg,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DsCardHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Motor insurance',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: ds?.colorTextPrimary,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Policy snapshot',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ds?.colorTextSecondary,
                          ),
                    ),
                  ],
                ),
              ),
              DsCardContent(
                child: DsCardInset(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Premium',
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: ds?.colorTextSecondary,
                                  ),
                            ),
                            Text(
                              '₹12,450 / yr',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: ds?.colorTextPrimary,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'IDV',
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: ds?.colorTextSecondary,
                                  ),
                            ),
                            Text(
                              '₹4.2L',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: ds?.colorTextPrimary,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DsCardFooter(
                child: Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Details'),
                    ),
                    FilledButton(
                      onPressed: () {},
                      child: const Text('Renew'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Interactive calendar previews (single, range, multi, dropdown).
class CalendarPreviewSection extends StatefulWidget {
  const CalendarPreviewSection({super.key, required this.labelStyle});

  final TextStyle? labelStyle;

  @override
  State<CalendarPreviewSection> createState() => _CalendarPreviewSectionState();
}

class _CalendarPreviewSectionState extends State<CalendarPreviewSection> {
  late DateTime _single;
  late DsDateRange _range;
  List<DateTime> _multi = [];

  @override
  void initState() {
    super.initState();
    final n = DateTime.now();
    _single = DateTime(n.year, n.month, n.day);
    _range = DsDateRange(start: _single, end: _single);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Single · inline', style: widget.labelStyle),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: DsCalendar(
            variant: DsCalendarVariant.single,
            display: DsCalendarDisplay.inline,
            value: _single,
            onChanged: (v) => setState(() => _single = v as DateTime),
          ),
        ),
        const SizedBox(height: 20),
        Text('Range · inline', style: widget.labelStyle),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: DsCalendar(
            variant: DsCalendarVariant.range,
            display: DsCalendarDisplay.inline,
            value: _range,
            onChanged: (v) => setState(() => _range = v as DsDateRange),
          ),
        ),
        const SizedBox(height: 20),
        Text('Multi · inline', style: widget.labelStyle),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: DsCalendar(
            variant: DsCalendarVariant.multi,
            display: DsCalendarDisplay.inline,
            value: _multi,
            onChanged: (v) =>
                setState(() => _multi = List<DateTime>.from(v as List<DateTime>)),
          ),
        ),
        const SizedBox(height: 20),
        Text('Single · dropdown', style: widget.labelStyle),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: DsCalendar(
              variant: DsCalendarVariant.single,
              display: DsCalendarDisplay.dropdown,
              value: _single,
              onChanged: (v) => setState(() => _single = v as DateTime),
            ),
          ),
        ),
      ],
    );
  }
}

/// Interactive previews for [DsCheckbox], [DsCheckboxRow], and [DsCheckboxGroup].
class CheckboxPreviewSection extends StatefulWidget {
  const CheckboxPreviewSection({
    super.key,
    required this.labelStyle,
  });

  final TextStyle? labelStyle;

  @override
  State<CheckboxPreviewSection> createState() => _CheckboxPreviewSectionState();
}

class _CheckboxPreviewSectionState extends State<CheckboxPreviewSection> {
  bool _atomMd = false;
  bool _szSm = false;
  bool _szMd = true;
  bool _szLg = false;

  bool _rowA = false;
  bool _rowB = true;

  List<String> _groupValue = <String>['email'];

  List<String> _composeGroup = <String>[];

  static const List<DsCheckboxOption> _groupOptions = [
    DsCheckboxOption(
      value: 'email',
      label: 'Email updates',
      description: 'Product news and tips.',
    ),
    DsCheckboxOption(
      value: 'sms',
      label: 'SMS alerts',
      description: 'Transactional texts only.',
    ),
    DsCheckboxOption(value: 'digest', label: 'Weekly digest'),
  ];

  static const List<DsCheckboxOption> _composeOptions = [
    DsCheckboxOption(
      value: 'a',
      label: 'Extra coverage A',
      description: 'Short supporting line.',
    ),
    DsCheckboxOption(
      value: 'b',
      label: 'Extra coverage B',
      description: 'Another option.',
    ),
    DsCheckboxOption(value: 'c', label: 'Title only row'),
  ];

  @override
  Widget build(BuildContext context) {
    final ds = Theme.of(context).extension<DsThemeExtension>();
    final lab = widget.labelStyle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Atom — sizes', style: lab),
        const SizedBox(height: 8),
        Wrap(
          spacing: 20,
          runSpacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            DsCheckbox(
              size: DsCheckboxSize.sm,
              checked: _szSm,
              onChange: (v) => setState(() => _szSm = v),
              label: 'Small',
            ),
            DsCheckbox(
              size: DsCheckboxSize.md,
              checked: _szMd,
              onChange: (v) => setState(() => _szMd = v),
              label: 'Medium',
            ),
            DsCheckbox(
              size: DsCheckboxSize.lg,
              checked: _szLg,
              onChange: (v) => setState(() => _szLg = v),
              label: 'Large',
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text('Atom — with description', style: lab),
        const SizedBox(height: 8),
        DsCheckbox(
          checked: _atomMd,
          onChange: (v) => setState(() => _atomMd = v),
          label: 'Marketing emails',
          description: 'Occasional product news. Unsubscribe anytime.',
        ),
        const SizedBox(height: 24),
        Text('Atom — disabled & error', style: lab),
        const SizedBox(height: 8),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            DsCheckbox(
              checked: false,
              onChange: (_) {},
              disabled: true,
              label: 'Disabled',
            ),
            DsCheckbox(
              checked: true,
              onChange: (_) {},
              disabled: true,
              label: 'Disabled checked',
            ),
            DsCheckbox(
              checked: false,
              onChange: (_) {},
              error: true,
              label: 'Error',
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text('CheckboxRow', style: lab),
        const SizedBox(height: 8),
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: ds?.colorBorder ?? const Color(0xFFB7B7B8)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DsCheckboxRow(
                label: 'Push notifications',
                description: 'Alerts on this device only.',
                checked: _rowA,
                onChange: (v) => setState(() => _rowA = v),
              ),
              DsCheckboxRow(
                label: 'Title only row',
                checked: _rowB,
                onChange: (v) => setState(() => _rowB = v),
                isLast: true,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text('CheckboxGroup', style: lab),
        const SizedBox(height: 8),
        DsCheckboxGroup(
          label: 'Notification channels',
          options: _groupOptions,
          value: _groupValue,
          onChange: (v) => setState(() => _groupValue = List<String>.from(v)),
        ),
        const SizedBox(height: 24),
        Text('With Alert', style: lab),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DsAlert(
              variant: DsAlertVariant.info,
              title: 'Choose add-ons',
              dismissible: true,
              onDismiss: () {},
              child: Text(
                'Select optional coverage below. Pricing updates when you continue.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: ds?.colorTextDefault,
                    ),
              ),
            ),
            const SizedBox(height: 16),
            DsCheckboxGroup(
              label: 'Optional extras',
              options: _composeOptions,
              value: _composeGroup,
              onChange: (v) => setState(() => _composeGroup = List<String>.from(v)),
            ),
          ],
        ),
      ],
    );
  }
}
