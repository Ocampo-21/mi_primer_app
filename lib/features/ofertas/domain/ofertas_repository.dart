import 'package:myapp1/features/ofertas/domain/oferta.dart';

/// Lo que la aplicación necesita saber de las ofertas.
///
/// `abstract interface class` = solo contrato: nadie puede heredar de aquí,
/// solo implementarlo.
abstract interface class OfertasRepository {
  Future<List<Oferta>> obtenerTodas();

  Future<Oferta?> obtenerPorId(String id);

  /// Propio de este dominio: filtrar por categoría (Lácteos, Panadería, etc.)
  Future<List<Oferta>> buscarPorCategoria(String categoria);
}
