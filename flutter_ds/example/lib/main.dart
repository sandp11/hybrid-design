import 'package:flutter/material.dart';
import 'package:flutter_ds/flutter_ds.dart';

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
      title: 'flutter_ds — Components',
      debugShowCheckedModeBanner: false,
      themeMode: _mode,
      theme: _lightTheme(),
      darkTheme: _darkTheme(),
      home: ButtonPreviewPage(
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
      ],
    );
  }
}

class ButtonPreviewPage extends StatelessWidget {
  const ButtonPreviewPage({
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
