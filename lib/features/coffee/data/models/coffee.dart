import 'package:freezed_annotation/freezed_annotation.dart';

part 'coffee.freezed.dart';
part 'coffee.g.dart';

@freezed
class Coffee with _$Coffee {
  factory Coffee({
    int? id,
    String? title,
    String? description,
    String? image,
    List<String>? ingredients,
  }) = _Coffee;

  factory Coffee.fromJson(Map<String, dynamic> json) => _$CoffeeFromJson(json);
}
