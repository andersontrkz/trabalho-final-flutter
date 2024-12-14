// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String,
      done: json['done'] as bool?,
      weather: json['weather'] as String,
      city: json['city'] as String,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'title': instance.title,
      'done': instance.done,
      'id': instance.id,
      'weather': instance.weather,
      'city': instance.city,
    };
