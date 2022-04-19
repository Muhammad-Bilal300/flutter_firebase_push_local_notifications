import 'package:json_annotation/json_annotation.dart';

import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Model {
  String? name;
  String? phoneNumber;
  Model({this.name, this.phoneNumber});
  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
  Map<String,dynamic> toJson() => _$ModelToJson(this);
}
