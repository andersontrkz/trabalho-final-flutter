import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/model/task.model.dart';

void main() {
  group('Task', () {
    test('deve criar um objeto Task', () {
      final Map<String, dynamic> json = {
        'id': 1,
        'title': 'Comprar leite',
        'done': true,
        'weather': 'sunny',
        'city': 'São Paulo'
      };

      final task = Task.fromJson(json);

      expect(task.id, 1);
      expect(task.title, 'Comprar leite');
      expect(task.done, true);
      expect(task.weather, 'sunny');
      expect(task.city, 'São Paulo');
    });

    test('deve converter um objeto Task', () {
      final task = Task(
        id: 1,
        title: 'Comprar leite',
        done: true,
        weather: 'sunny',
        city: 'São Paulo',
      );

      final json = task.toJson();

      expect(json['id'], 1);
      expect(json['title'], 'Comprar leite');
      expect(json['done'], true);
      expect(json['weather'], 'sunny');
      expect(json['city'], 'São Paulo');
    });

    test('deve mapear corretamente com valores nulos', () {
      final task = Task(
        id: 1,
        title: 'Comprar leite',
        done: null,
        weather: 'sunny',
        city: 'São Paulo',
      );

      final json = task.toJson();

      expect(json['done'], null);

      final taskFromJson = Task.fromJson(json);

      expect(taskFromJson.done, null);
    });

    test('deve gerar JSON correto com valores nulos', () {
      final task = Task(
        id: 2,
        title: 'Estudar para prova',
        done: null,
        weather: 'cloudy',
        city: 'Rio de Janeiro',
      );

      final json = task.toJson();

      expect(json['done'], null);
    });
  });
}
