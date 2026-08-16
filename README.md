# myapp1 — Ofertas

App de ofertas de productos próximos a vencer, hecha en Flutter siguiendo
arquitectura limpia (domain / data / presentation)

## Estructura

- **lib/core/**
  - `json.dart` — lectores defensivos: leerTexto, leerFecha, leerDecimal, leerEntero, etc.
  - `comparaciones.dart` — listasIguales
- **lib/features/ofertas/**
  - `domain/` — Oferta, Dinero, EstadoOferta, OfertasRepository
  - `data/` — OfertasLocales (implementación con rootBundle)
  - `presentation/` — pendiente, semana 3
- **lib/main.dart**
- **assets/data/ofertas.json** — 3 registros: disponible, reservada, vencida
- **test/domain/oferta_test.dart** — 12 pruebas
- **test/data/ofertas_locales_test.dart** — 5 pruebas

## El dominio

- **Dinero**: objeto de valor con `valor` y `moneda`.
- **EstadoOferta**: clase sellada con 4 estados — `Disponible(cantidadDisponible)`,
  `Reservada(reservadaPor, reservadaEn)`, `Vendida(vendidaEn)`, `Vencida(vencidaEn)`.
- **Oferta**: entidad con `id`, `nombreProducto`, `descripcion` (opcional),
  `categoria`, `precioOriginal`, `precioOferta`, `cantidadDisponible`,
  `fechaVencimiento`, `estado`, `fotos`.

Ninguno de estos archivos importa `package:flutter/...`: el dominio se puede
probar sin el motor de Flutter, solo con Dart puro.

## Correr las pruebas
18 pruebas en total: 12 sobre `Oferta` (serialización, igualdad/copia, reglas
de negocio) y 5 sobre `OfertasLocales`, más la del widget de ejemplo.

## Decisión: modelo a mano vs. freezed

Probé generar el modelo `Oferta` con freezed (Paso 11) y decidí quedarme
con la versión escrita a mano para esta entrega.

Razón principal: mis funciones de `core/json.dart` (`leerTexto`, `leerFecha`,
etc.) lanzan `CampoInvalido` con el nombre exacto del campo que falló. Con
freezed + json_serializable, un campo faltante en el JSON da un error genérico
de Dart (`type 'Null' is not a subtype of type 'String'`), que no dice cuál
de los ocho campos de `Oferta` fue. Para un proyecto pequeño donde el JSON
todavía cambia seguido, prefiero el mensaje de error útil sobre las líneas
que me ahorro con el generador.

Los archivos `*.freezed.dart` y `*.g.dart` de la prueba (`oferta_freezed.dart`)
sí están en el repositorio, sin agregarlos a `.gitignore`, porque quiero que
quien revise el laboratorio pueda ver el resultado generado sin tener que
correr `build_runner` primero.