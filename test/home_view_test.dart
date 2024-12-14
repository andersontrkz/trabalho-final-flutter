import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myapp/views/home.view.dart';

void main() {
  testWidgets('HomeView deve exibir tela inicial', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomeView(),
      ),
    );

    expect(find.text('Bem-vindo ao seu gerenciador de tarefas diárias!'), findsOneWidget);

    expect(find.text('Começar a Gerenciar Atividades'), findsOneWidget);

    expect(find.text('Trocar Tema'), findsOneWidget);
  });

  testWidgets('HomeView deve navegar para /tasks', (WidgetTester tester) async {
    final navigatorKey = GlobalKey<NavigatorState>();

    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: navigatorKey,
        routes: {
          '/tasks': (context) => Scaffold(body: Text('Tarefas'))
        },
        home: HomeView(),
      ),
    );

    expect(find.text('Bem-vindo ao seu gerenciador de tarefas diárias!'), findsOneWidget);
    expect(find.text('Começar a Gerenciar Atividades'), findsOneWidget);
    expect(find.text('Trocar Tema'), findsOneWidget);

    await tester.tap(find.text('Começar a Gerenciar Atividades'));
    await tester.pumpAndSettle();

    expect(find.text('Tarefas'), findsOneWidget);
  });
}
