import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/widgets/task_input_form.dart';

void main() {
  testWidgets('TaskInputForm deve renderizar corretamente', (WidgetTester tester) async {
    bool onSubmitCalled = true;
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TaskInputForm(
            controller: controller,
            onSubmit: () => onSubmitCalled,
          ),
        ),
      ),
    );

    expect(find.byType(TextFormField), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), 'Nova tarefa');

    await tester.tap(find.byType(TextFormField));
    await tester.pumpAndSettle();

    expect(onSubmitCalled, true);

    controller.dispose();
  });
}
