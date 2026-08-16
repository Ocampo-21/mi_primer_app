import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:myapp1/core/json.dart';
import 'package:myapp1/features/ofertas/domain/oferta.dart';
import 'package:myapp1/features/ofertas/domain/ofertas_repository.dart';

/// Cómo se lee un archivo de texto. Se inyecta para poder probar sin assets.
typedef LectorDeAssets = Future<String> Function(String ruta);

class OfertasLocales implements OfertasRepository {
  /// El lector entra por el constructor. En producción es `rootBundle`; en
  /// las pruebas, una función que devuelve una cadena.
  OfertasLocales({
    LectorDeAssets? lector,
    this.ruta = 'assets/data/ofertas.json',
  }) : _lector = lector ?? rootBundle.loadString;

  final LectorDeAssets _lector;
  final String ruta;

  /// El archivo no cambia mientras la app corre.
  List<Oferta>? _cache;

  @override
  Future<List<Oferta>> obtenerTodas() async {
    final guardado = _cache;
    if (guardado != null) return guardado;

    final crudo = await _lector(ruta);
    final decodificado = jsonDecode(crudo);

    if (decodificado is! List) {
      throw const CampoInvalido(
        '(raíz)',
        'el archivo debe contener una lista',
        null,
      );
    }

    return _cache = decodificado
        .map((e) => Oferta.fromJson(e as Map<String, dynamic>))
        .toList(growable: false);
  }

  @override
  Future<Oferta?> obtenerPorId(String id) async {
    for (final oferta in await obtenerTodas()) {
      if (oferta.id == id) return oferta;
    }
    return null;
  }

  @override
  Future<List<Oferta>> buscarPorCategoria(String categoria) async {
    final todas = await obtenerTodas();
    return todas
        .where((oferta) => oferta.categoria == categoria)
        .toList(growable: false);
  }
}
