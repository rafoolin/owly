import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class ColorConverter extends JsonConverter<Color, int> {
  const ColorConverter();
  @override
  Color fromJson(int json) => Color(json);

  @override
  toJson(Color object) => object.value;
}

class TimeZConverter extends JsonConverter<TimeOfDay, String> {
  const TimeZConverter();

  @override
  TimeOfDay fromJson(String json) {
    final parts = json.split(':');
    final hour = int.parse(parts.first);
    final minute = int.parse(parts[1]);
    return TimeOfDay(hour: hour, minute: minute);
  }

  @override
  String toJson(TimeOfDay object) {
    return '${object.hour}:${object.minute}';
  }
}
