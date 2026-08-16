import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:myapp1/core/json.dart';
import 'package:myapp1/features/ofertas/domain/dinero.dart';
import 'package:myapp1/features/ofertas/domain/estado_oferta.dart';
import 'package:myapp1/features/ofertas/domain/oferta.dart';

Oferta oferta({
  EstadoOferta? estado,
  List<String>? fotos,
  String? descripcion,
}) => Oferta(
  id: 'of-001',
  nombreProducto: 'Yogur de fresa',
  descripcion: descripcion ?? 'Yogur próximo a vencer.',
  categoria: 'Lácteos',
  precioOriginal: const Dinero(valor: 5000, moneda: 'COP'),
  precioOferta: const Dinero(valor: 3000, moneda: 'COP'),
  cantidadDisponible: 10,
  fechaVencimiento: DateTime.utc(2026, 8, 20, 23, 59, 59),
  estado: estado ?? const Disponible(10),
  fotos: fotos ?? const <String>[],
);

void main() {
  group('serialización', () {
    test('una oferta sobrevive la ida y vuelta a JSON sin perder nada', () {
      final original = oferta(
        estado: Reservada('cliente-001', DateTime.utc(2026, 8, 15, 23)),
        fotos: const ['assets/images/yogur1.png'],
      );

      final texto = jsonEncode(original.toJson());
      final vuelta = Oferta.fromJson(jsonDecode(texto) as Map<String, dynamic>);

      expect(vuelta, equals(original));
    });

    test('una oferta sin la clave fotos se lee con la lista vacía', () {
      final json = oferta().toJson()..remove('fotos');
      expect(Oferta.fromJson(json).fotos, isEmpty);
    });

    test(
      'una oferta sin nombreProducto dice QUÉ campo falló, no solo que falló',
      () {
        final json = oferta().toJson()..remove('nombreProducto');

        expect(
          () => Oferta.fromJson(json),
          throwsA(
            isA<CampoInvalido>().having(
              (e) => e.campo,
              'campo',
              'nombreProducto',
            ),
          ),
        );
      },
    );

    test('una fecha de vencimiento que no es ISO 8601 se rechaza', () {
      final json = oferta().toJson()..['fechaVencimiento'] = '20 de agosto';
      expect(() => Oferta.fromJson(json), throwsA(isA<CampoInvalido>()));
    });

    test('la hora se conserva en UTC y no se corre cinco horas', () {
      final json = oferta().toJson();
      expect(json['fechaVencimiento'], '2026-08-20T23:59:59.000Z');
    });
  });

  group('igualdad y copia', () {
    test('dos ofertas con los mismos datos son iguales', () {
      expect(oferta(), equals(oferta()));
    });

    test('dos ofertas con los mismos datos comparten hashCode', () {
      expect(oferta().hashCode, equals(oferta().hashCode));
      expect({oferta(), oferta()}.length, 1);
    });

    test('dos ofertas con fotos distintas NO son iguales', () {
      expect(
        oferta(fotos: const ['a.png']),
        isNot(equals(oferta(fotos: const ['b.png']))),
      );
    });

    test('copyWith cambia solo lo que se le pasa', () {
      final original = oferta();
      final copia = original.copyWith(nombreProducto: 'Yogur de mora');

      expect(copia.nombreProducto, 'Yogur de mora');
      expect(copia.id, original.id);
      expect(copia.fechaVencimiento, original.fechaVencimiento);
    });
  });

  group('reglas de negocio', () {
    test('una oferta con estado Vencida no se puede comprar', () {
      expect(
        oferta(estado: Vencida(DateTime.utc(2026, 8, 16))).sePuedeComprar,
        isFalse,
      );
    });

    test('una oferta con estado Disponible sí se puede comprar', () {
      expect(oferta(estado: const Disponible(5)).sePuedeComprar, isTrue);
    });

    test('una oferta con fecha de vencimiento pasada está vencida', () {
      final ahora = DateTime.utc(2026, 9, 1);
      expect(oferta().estaVencida(ahora), isTrue);
    });
  });
}
