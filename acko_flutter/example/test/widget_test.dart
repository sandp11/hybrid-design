import 'package:flutter_test/flutter_test.dart';

import 'package:acko_flutter_example/main.dart';

void main() {
  testWidgets('preview app renders shell', (WidgetTester tester) async {
    await tester.pumpWidget(const FlutterDsPreviewApp());
    expect(find.text('Components'), findsOneWidget);
  });
}
