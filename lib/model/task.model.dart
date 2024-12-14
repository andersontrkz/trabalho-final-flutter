import 'package:json_annotation/json_annotation.dart';

part 'task.model.g.dart';

@JsonSerializable()
class Task {
  final String title;
  final bool? done;
  final int? id;
  final String weather;
  final String city;

  Task({this.id, required this.title, this.done, required this.weather, required this.city});

  factory Task.fromJson(Map<String, dynamic> json) =>
      _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
