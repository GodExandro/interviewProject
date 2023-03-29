// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'data_model.g.dart';

@JsonSerializable()
class DataModel extends Equatable {
  final String title;
  final String description;
  final String image_url;
  final String modificationDate;
  final int orderId;

  const DataModel(
      {required this.title,
      required this.description,
      required this.image_url,
      required this.modificationDate,
      required this.orderId});

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);

  @override
  List<Object> get props =>
      [title, description, image_url, modificationDate, orderId];
}
