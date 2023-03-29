// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      title: json['title'] as String,
      description: json['description'] as String,
      image_url: json['image_url'] as String,
      modificationDate: json['modificationDate'] as String,
      orderId: json['orderId'] as int,
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.image_url,
      'modificationDate': instance.modificationDate,
      'orderId': instance.orderId,
    };
