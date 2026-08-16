import 'package:myapp1/core/json.dart';

/// Cuánto vale algo, en qué moneda.
///
/// Es un **objeto de valor**: dos montos con el mismo valor y moneda son
/// el mismo dinero, así que no lleva `id` y se compara por contenido.

class Dinero {
  const Dinero({required this.valor, required this.moneda})
    : assert(valor >= 0, 'el valor no puede ser negativo');

  factory Dinero.fromJson(Map<String, dynamic> json) => Dinero(
    valor: leerDecimal(json, 'valor'),
    moneda: leerTexto(json, 'moneda'),
  );

  final double valor;
  final String moneda;

  Map<String, dynamic> toJson() => {'valor': valor, 'moneda': moneda};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Dinero && other.valor == valor && other.moneda == moneda;

  @override
  int get hashCode => Object.hash(valor, moneda);

  @override
  String toString() => 'Dinero($valor $moneda)';
}
