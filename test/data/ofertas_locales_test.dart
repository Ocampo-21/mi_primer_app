import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:myapp1/core/json.dart';
import 'package:myapp1/features/ofertas/data/ofertas_locales.dart';

const _json = '''
[
  {
    "id": "of-001",
    "nombreProducto": "Yogur de fresa",
    "categoria": "Lácteos",
    "precioOriginal": { "valor": 5000, "moneda": "COP" },
    "precioOferta": { "valor": 3000, "moneda": "COP" },
    "cantidadDisponible": 10,
    "fechaVencimiento": "2026-08-20T23:59:59Z",
    "estado": { "tipo": "disponible", "cantidadDisponible": 10 }
  },
  {
    "id": "of-004",
    "nombreProducto": "Pan francés",
    "categoria": "Panadería",
    "precioOriginal": { "valor": 3000, "moneda": "COP" },
    "precioOferta": { "valor": 1500, "moneda": "COP" },
    "cantidadDisponible": 8,
    "fechaVencimiento": "2026-08-19T23:59:59Z",
    "estado": { "tipo": "disponible", "cantidadDisponible": 8 }
  }
]
''';

void main() {
  test('lee la lista completa del archivo', () async {
    final repo = OfertasLocales(lector: (_) async => _json);
    expect((await repo.obtenerTodas()).length, 2);
  });

  test('busca por id y devuelve null cuando no está', () async {
    final repo = OfertasLocales(lector: (_) async => _json);

    expect(
      (await repo.obtenerPorId('of-001'))?.nombreProducto,
      'Yogur de fresa',
    );
    expect(await repo.obtenerPorId('no-existe'), isNull);
  });

  test('un archivo que no es una lista se rechaza', () async {
    final repo = OfertasLocales(lector: (_) async => '{"a": 1}');
    expect(repo.obtenerTodas(), throwsA(isA<CampoInvalido>()));
  });

  test('buscarPorCategoria filtra solo las ofertas de esa categoría', () async {
    final repo = OfertasLocales(lector: (_) async => _json);
    final resultado = await repo.buscarPorCategoria('Panadería');

    expect(resultado.length, 1);
    expect(resultado.first.nombreProducto, 'Pan francés');
  });

  test(
    'el asset declarado en pubspec existe y el modelo lo entiende',
    () async {
      // Esta SÍ toca el bundle: es la única que caza "olvidé el pubspec".
      TestWidgetsFlutterBinding.ensureInitialized();

      final repo = OfertasLocales(lector: rootBundle.loadString);
      expect((await repo.obtenerTodas()).length, greaterThanOrEqualTo(3));
    },
  );
}
