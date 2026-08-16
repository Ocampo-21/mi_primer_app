import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myapp1/features/ofertas/domain/estado_oferta.dart';

part 'oferta_freezed.freezed.dart';
part 'oferta_freezed.g.dart';

@freezed
abstract class OfertaFreezed with _$OfertaFreezed {
  const factory OfertaFreezed({
    required String id,
    required String nombreProducto,
    String? descripcion,
    required String categoria,
    required double precioOriginal,
    required double precioOferta,
    required int cantidadDisponible,
    required DateTime fechaVencimiento,
    required EstadoOferta estado,
    @Default(<String>[]) List<String> fotos,
  }) = _OfertaFreezed;

  /// Sin este constructor privado, freezed NO deja añadir métodos propios.
  const OfertaFreezed._();

  factory OfertaFreezed.fromJson(Map<String, dynamic> json) =>
      _$OfertaFreezedFromJson(json);

  // Las reglas de negocio siguen siendo tuyas: freezed no las toca.
  bool get tieneDescuento => precioOferta < precioOriginal;

  bool get sePuedeComprar => estado.sePuedeComprar;

  bool estaVencida(DateTime ahora) => ahora.isAfter(fechaVencimiento);
}
