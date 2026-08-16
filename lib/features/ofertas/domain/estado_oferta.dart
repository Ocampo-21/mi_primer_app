import 'package:myapp1/core/json.dart';

/// En qué punto de su vida está una oferta.
///
/// `sealed` significa dos cosas: nadie fuera de este archivo puede añadir un
/// estado, y el compilador conoce la lista completa. Eso es lo que hace que
/// los `switch` de abajo puedan ser exhaustivos sin `default`.
sealed class EstadoOferta {
  const EstadoOferta();

  /// El ÚNICO sitio donde un texto del JSON se convierte en un tipo.
  factory EstadoOferta.fromJson(Map<String, dynamic> json) {
    final tipo = leerTexto(json, 'tipo');
    return switch (tipo) {
      'disponible' => Disponible(leerEntero(json, 'cantidadDisponible')),
      'reservada' => Reservada(
        leerTexto(json, 'reservadaPor'),
        leerFecha(json, 'reservadaEn'),
      ),
      'vendida' => Vendida(leerFecha(json, 'vendidaEn')),
      'vencida' => Vencida(leerFecha(json, 'vencidaEn')),
      _ => throw CampoInvalido('estado.tipo', 'no es un estado conocido', tipo),
    };
  }

  /// Y el único sitio donde vuelve a ser texto. Simétrico a fromJson: si
  /// añades un estado arriba y olvidas añadirlo aquí, esto no compila.
  Map<String, dynamic> toJson() => switch (this) {
    Disponible(:final cantidadDisponible) => {
      'tipo': 'disponible',
      'cantidadDisponible': cantidadDisponible,
    },
    Reservada(:final reservadaPor, :final reservadaEn) => {
      'tipo': 'reservada',
      'reservadaPor': reservadaPor,
      'reservadaEn': reservadaEn.toIso8601String(),
    },
    Vendida(:final vendidaEn) => {
      'tipo': 'vendida',
      'vendidaEn': vendidaEn.toIso8601String(),
    },
    Vencida(:final vencidaEn) => {
      'tipo': 'vencida',
      'vencidaEn': vencidaEn.toIso8601String(),
    },
  };

  /// Regla de negocio, no de interfaz: en qué estados se puede comprar.
  bool get sePuedeComprar => switch (this) {
    Disponible() => true,
    Reservada() || Vendida() || Vencida() => false,
  };

  /// Texto para la pantalla.
  String get etiqueta => switch (this) {
    Disponible(:final cantidadDisponible) =>
      'Disponible · $cantidadDisponible unidades',
    Reservada(:final reservadaPor) => 'Reservada · $reservadaPor',
    Vendida() => 'Vendida',
    Vencida() => 'Vencida',
  };
}

final class Disponible extends EstadoOferta {
  const Disponible(this.cantidadDisponible);

  final int cantidadDisponible;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Disponible && other.cantidadDisponible == cantidadDisponible;

  @override
  int get hashCode => Object.hash(runtimeType, cantidadDisponible);

  @override
  String toString() => 'Disponible($cantidadDisponible)';
}

final class Reservada extends EstadoOferta {
  const Reservada(this.reservadaPor, this.reservadaEn);

  final String reservadaPor;
  final DateTime reservadaEn;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Reservada &&
          other.reservadaPor == reservadaPor &&
          other.reservadaEn == reservadaEn;

  @override
  int get hashCode => Object.hash(runtimeType, reservadaPor, reservadaEn);

  @override
  String toString() => 'Reservada($reservadaPor, $reservadaEn)';
}

final class Vendida extends EstadoOferta {
  const Vendida(this.vendidaEn);

  final DateTime vendidaEn;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Vendida && other.vendidaEn == vendidaEn;

  @override
  int get hashCode => Object.hash(runtimeType, vendidaEn);

  @override
  String toString() => 'Vendida($vendidaEn)';
}

final class Vencida extends EstadoOferta {
  const Vencida(this.vencidaEn);

  final DateTime vencidaEn;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Vencida && other.vencidaEn == vencidaEn;

  @override
  int get hashCode => Object.hash(runtimeType, vencidaEn);

  @override
  String toString() => 'Vencida($vencidaEn)';
}
