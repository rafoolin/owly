import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class ColorConverter extends JsonConverter<Color, int> {
  const ColorConverter();
  @override
  Color fromJson(int json) => Color(json);

  @override
  toJson(Color object) => object.value;
}
