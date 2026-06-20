import 'dart:math';

import 'package:flutter/material.dart';

class Pregunta2 extends StatelessWidget {
  const Pregunta2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
      Text("Calcular la energía cinética de un objeto en movimiento, dada su masa y velocidad."),
      Text(""),
      inputMasa(),
      inputVelocidad(),
      btnCalcular(context)
      ],
     ));
  }
}

TextEditingController _masa = TextEditingController();
Widget inputMasa() {
  return (TextField(
    controller: _masa,
    keyboardType: TextInputType.numberWithOptions(),
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hint: Text("Ingrese la masa"),
    ),
  ));
}

TextEditingController _velocidad = TextEditingController();
Widget inputVelocidad() {
  return (TextField(
    controller: _velocidad,
    keyboardType: TextInputType.numberWithOptions(),
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hint: Text("Ingrese la velocidad"),
    ),
  ));
}

Widget btnCalcular(BuildContext context) {
  return (ElevatedButton(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Colors.indigoAccent),
    ),
    onPressed: () => resultado(context),
    child: Text("Calcular", style: TextStyle(fontSize: 20)),
  ));
}

void resultado(BuildContext context) {
  double masa = 0;
  double velocidad = 0;

  if (velocidad == 0) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Resultado"),
        content: Text("El objeto está en reposo (energía = 0)"),
      ),
    );
  } else {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Resultado"),
        content: Text(
          "La energia cinetica de un objeto en movimiento es: ${calcularEnergia(masa, velocidad)}",
        ),
      ),
    );
  }
}

double calcularEnergia(double masa, double velocidad) {
  double ec = 0.5 * masa * pow(velocidad, 2);
  return ec;
}
