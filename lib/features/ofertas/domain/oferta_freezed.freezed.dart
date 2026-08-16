// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'oferta_freezed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OfertaFreezed {

 String get id; String get nombreProducto; String? get descripcion; String get categoria; double get precioOriginal; double get precioOferta; int get cantidadDisponible; DateTime get fechaVencimiento; EstadoOferta get estado; List<String> get fotos;
/// Create a copy of OfertaFreezed
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfertaFreezedCopyWith<OfertaFreezed> get copyWith => _$OfertaFreezedCopyWithImpl<OfertaFreezed>(this as OfertaFreezed, _$identity);

  /// Serializes this OfertaFreezed to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfertaFreezed&&(identical(other.id, id) || other.id == id)&&(identical(other.nombreProducto, nombreProducto) || other.nombreProducto == nombreProducto)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.categoria, categoria) || other.categoria == categoria)&&(identical(other.precioOriginal, precioOriginal) || other.precioOriginal == precioOriginal)&&(identical(other.precioOferta, precioOferta) || other.precioOferta == precioOferta)&&(identical(other.cantidadDisponible, cantidadDisponible) || other.cantidadDisponible == cantidadDisponible)&&(identical(other.fechaVencimiento, fechaVencimiento) || other.fechaVencimiento == fechaVencimiento)&&(identical(other.estado, estado) || other.estado == estado)&&const DeepCollectionEquality().equals(other.fotos, fotos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombreProducto,descripcion,categoria,precioOriginal,precioOferta,cantidadDisponible,fechaVencimiento,estado,const DeepCollectionEquality().hash(fotos));

@override
String toString() {
  return 'OfertaFreezed(id: $id, nombreProducto: $nombreProducto, descripcion: $descripcion, categoria: $categoria, precioOriginal: $precioOriginal, precioOferta: $precioOferta, cantidadDisponible: $cantidadDisponible, fechaVencimiento: $fechaVencimiento, estado: $estado, fotos: $fotos)';
}


}

/// @nodoc
abstract mixin class $OfertaFreezedCopyWith<$Res>  {
  factory $OfertaFreezedCopyWith(OfertaFreezed value, $Res Function(OfertaFreezed) _then) = _$OfertaFreezedCopyWithImpl;
@useResult
$Res call({
 String id, String nombreProducto, String? descripcion, String categoria, double precioOriginal, double precioOferta, int cantidadDisponible, DateTime fechaVencimiento, EstadoOferta estado, List<String> fotos
});




}
/// @nodoc
class _$OfertaFreezedCopyWithImpl<$Res>
    implements $OfertaFreezedCopyWith<$Res> {
  _$OfertaFreezedCopyWithImpl(this._self, this._then);

  final OfertaFreezed _self;
  final $Res Function(OfertaFreezed) _then;

/// Create a copy of OfertaFreezed
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nombreProducto = null,Object? descripcion = freezed,Object? categoria = null,Object? precioOriginal = null,Object? precioOferta = null,Object? cantidadDisponible = null,Object? fechaVencimiento = null,Object? estado = null,Object? fotos = null,}) {
  return _then(OfertaFreezed(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombreProducto: null == nombreProducto ? _self.nombreProducto : nombreProducto // ignore: cast_nullable_to_non_nullable
as String,descripcion: freezed == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String?,categoria: null == categoria ? _self.categoria : categoria // ignore: cast_nullable_to_non_nullable
as String,precioOriginal: null == precioOriginal ? _self.precioOriginal : precioOriginal // ignore: cast_nullable_to_non_nullable
as double,precioOferta: null == precioOferta ? _self.precioOferta : precioOferta // ignore: cast_nullable_to_non_nullable
as double,cantidadDisponible: null == cantidadDisponible ? _self.cantidadDisponible : cantidadDisponible // ignore: cast_nullable_to_non_nullable
as int,fechaVencimiento: null == fechaVencimiento ? _self.fechaVencimiento : fechaVencimiento // ignore: cast_nullable_to_non_nullable
as DateTime,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as EstadoOferta,fotos: null == fotos ? _self.fotos : fotos // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [OfertaFreezed].
extension OfertaFreezedPatterns on OfertaFreezed {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfertaFreezed value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfertaFreezed() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfertaFreezed value)  $default,){
final _that = this;
switch (_that) {
case _OfertaFreezed():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfertaFreezed value)?  $default,){
final _that = this;
switch (_that) {
case _OfertaFreezed() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nombreProducto,  String? descripcion,  String categoria,  double precioOriginal,  double precioOferta,  int cantidadDisponible,  DateTime fechaVencimiento,  EstadoOferta estado,  List<String> fotos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfertaFreezed() when $default != null:
return $default(_that.id,_that.nombreProducto,_that.descripcion,_that.categoria,_that.precioOriginal,_that.precioOferta,_that.cantidadDisponible,_that.fechaVencimiento,_that.estado,_that.fotos);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nombreProducto,  String? descripcion,  String categoria,  double precioOriginal,  double precioOferta,  int cantidadDisponible,  DateTime fechaVencimiento,  EstadoOferta estado,  List<String> fotos)  $default,) {final _that = this;
switch (_that) {
case _OfertaFreezed():
return $default(_that.id,_that.nombreProducto,_that.descripcion,_that.categoria,_that.precioOriginal,_that.precioOferta,_that.cantidadDisponible,_that.fechaVencimiento,_that.estado,_that.fotos);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nombreProducto,  String? descripcion,  String categoria,  double precioOriginal,  double precioOferta,  int cantidadDisponible,  DateTime fechaVencimiento,  EstadoOferta estado,  List<String> fotos)?  $default,) {final _that = this;
switch (_that) {
case _OfertaFreezed() when $default != null:
return $default(_that.id,_that.nombreProducto,_that.descripcion,_that.categoria,_that.precioOriginal,_that.precioOferta,_that.cantidadDisponible,_that.fechaVencimiento,_that.estado,_that.fotos);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OfertaFreezed extends OfertaFreezed {
  const _OfertaFreezed({required this.id, required this.nombreProducto, this.descripcion, required this.categoria, required this.precioOriginal, required this.precioOferta, required this.cantidadDisponible, required this.fechaVencimiento, required this.estado,  List<String> fotos = const <String>[]}): _fotos = fotos,super._();
  factory _OfertaFreezed.fromJson(Map<String, dynamic> json) => _$OfertaFreezedFromJson(json);

@override final  String id;
@override final  String nombreProducto;
@override final  String? descripcion;
@override final  String categoria;
@override final  double precioOriginal;
@override final  double precioOferta;
@override final  int cantidadDisponible;
@override final  DateTime fechaVencimiento;
@override final  EstadoOferta estado;
 final  List<String> _fotos;
@override@JsonKey() List<String> get fotos {
  if (_fotos is EqualUnmodifiableListView) return _fotos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fotos);
}


/// Create a copy of OfertaFreezed
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfertaFreezedCopyWith<_OfertaFreezed> get copyWith => __$OfertaFreezedCopyWithImpl<_OfertaFreezed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfertaFreezedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfertaFreezed&&(identical(other.id, id) || other.id == id)&&(identical(other.nombreProducto, nombreProducto) || other.nombreProducto == nombreProducto)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.categoria, categoria) || other.categoria == categoria)&&(identical(other.precioOriginal, precioOriginal) || other.precioOriginal == precioOriginal)&&(identical(other.precioOferta, precioOferta) || other.precioOferta == precioOferta)&&(identical(other.cantidadDisponible, cantidadDisponible) || other.cantidadDisponible == cantidadDisponible)&&(identical(other.fechaVencimiento, fechaVencimiento) || other.fechaVencimiento == fechaVencimiento)&&(identical(other.estado, estado) || other.estado == estado)&&const DeepCollectionEquality().equals(other._fotos, _fotos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombreProducto,descripcion,categoria,precioOriginal,precioOferta,cantidadDisponible,fechaVencimiento,estado,const DeepCollectionEquality().hash(_fotos));

@override
String toString() {
  return 'OfertaFreezed(id: $id, nombreProducto: $nombreProducto, descripcion: $descripcion, categoria: $categoria, precioOriginal: $precioOriginal, precioOferta: $precioOferta, cantidadDisponible: $cantidadDisponible, fechaVencimiento: $fechaVencimiento, estado: $estado, fotos: $fotos)';
}


}

/// @nodoc
abstract mixin class _$OfertaFreezedCopyWith<$Res> implements $OfertaFreezedCopyWith<$Res> {
  factory _$OfertaFreezedCopyWith(_OfertaFreezed value, $Res Function(_OfertaFreezed) _then) = __$OfertaFreezedCopyWithImpl;
@override @useResult
$Res call({
 String id, String nombreProducto, String? descripcion, String categoria, double precioOriginal, double precioOferta, int cantidadDisponible, DateTime fechaVencimiento, EstadoOferta estado, List<String> fotos
});




}
/// @nodoc
class __$OfertaFreezedCopyWithImpl<$Res>
    implements _$OfertaFreezedCopyWith<$Res> {
  __$OfertaFreezedCopyWithImpl(this._self, this._then);

  final _OfertaFreezed _self;
  final $Res Function(_OfertaFreezed) _then;

/// Create a copy of OfertaFreezed
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nombreProducto = null,Object? descripcion = freezed,Object? categoria = null,Object? precioOriginal = null,Object? precioOferta = null,Object? cantidadDisponible = null,Object? fechaVencimiento = null,Object? estado = null,Object? fotos = null,}) {
  return _then(_OfertaFreezed(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombreProducto: null == nombreProducto ? _self.nombreProducto : nombreProducto // ignore: cast_nullable_to_non_nullable
as String,descripcion: freezed == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String?,categoria: null == categoria ? _self.categoria : categoria // ignore: cast_nullable_to_non_nullable
as String,precioOriginal: null == precioOriginal ? _self.precioOriginal : precioOriginal // ignore: cast_nullable_to_non_nullable
as double,precioOferta: null == precioOferta ? _self.precioOferta : precioOferta // ignore: cast_nullable_to_non_nullable
as double,cantidadDisponible: null == cantidadDisponible ? _self.cantidadDisponible : cantidadDisponible // ignore: cast_nullable_to_non_nullable
as int,fechaVencimiento: null == fechaVencimiento ? _self.fechaVencimiento : fechaVencimiento // ignore: cast_nullable_to_non_nullable
as DateTime,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as EstadoOferta,fotos: null == fotos ? _self._fotos : fotos // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
