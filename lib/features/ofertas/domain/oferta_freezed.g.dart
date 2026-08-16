// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oferta_freezed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OfertaFreezed _$OfertaFreezedFromJson(Map<String, dynamic> json) =>
    _OfertaFreezed(
      id: json['id'] as String,
      nombreProducto: json['nombreProducto'] as String,
      descripcion: json['descripcion'] as String?,
      categoria: json['categoria'] as String,
      precioOriginal: (json['precioOriginal'] as num).toDouble(),
      precioOferta: (json['precioOferta'] as num).toDouble(),
      cantidadDisponible: (json['cantidadDisponible'] as num).toInt(),
      fechaVencimiento: DateTime.parse(json['fechaVencimiento'] as String),
      estado: EstadoOferta.fromJson(json['estado'] as Map<String, dynamic>),
      fotos:
          (json['fotos'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const <String>[],
    );

Map<String, dynamic> _$OfertaFreezedToJson(_OfertaFreezed instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombreProducto': instance.nombreProducto,
      'descripcion': instance.descripcion,
      'categoria': instance.categoria,
      'precioOriginal': instance.precioOriginal,
      'precioOferta': instance.precioOferta,
      'cantidadDisponible': instance.cantidadDisponible,
      'fechaVencimiento': instance.fechaVencimiento.toIso8601String(),
      'estado': instance.estado,
      'fotos': instance.fotos,
    };
