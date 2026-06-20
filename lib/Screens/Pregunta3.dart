import 'package:flutter/material.dart';

class Pregunta3 extends StatelessWidget {
  const Pregunta3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column());
  }
}

TextEditingController _distancia = TextEditingController();
Widget inputDistancia() {
  return (TextField(
    controller: _distancia,
    keyboardType: TextInputType.numberWithOptions(),
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hint: Text("Ingresa la distacia recorrida (km)"),
    ),
  ));
}

TextEditingController _precioLitros = TextEditingController();
Widget inputPrecio() {
  return (TextField(
    controller: _precioLitros,
    keyboardType: TextInputType.numberWithOptions(),
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hint: Text("Ingresa el precio por litro de combustible"),
    ),
  ));
}

TextEditingController _eficiencia = TextEditingController();

Widget inputEficiencia() {
  return TextField(
    controller: _eficiencia,
    keyboardType: TextInputType.numberWithOptions(decimal: true),
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: "Ingresa la eficiencia (km/litro)",
    ),
  );
}

Widget btnCalcularCosto(BuildContext context) {
  return (ElevatedButton(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Colors.indigoAccent),
    ),
    onPressed: () => resultado(context),
    child: Text("Calcular", style: TextStyle(fontSize: 20)),
  ));
}

double calcularCosto(double distancia, double precio, double eficiencia) {
  double litros = distancia / eficiencia;
  double costoTotal = litros * precio;
  return costoTotal;
}

void resultado(BuildContext context) {
  double distancia = double.parse(_distancia.text);
  double eficiencia = double.parse(_eficiencia.text);
  double precio = double.parse(_precioLitros.text);
  if (eficiencia <= 0) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text("La eficiencia debe ser un numero mayor a 0"),
      ),
    );
  } else {
    double costoTotal = calcularCosto(distancia, precio, eficiencia);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Costo Total"),
        content: Text("El costo total del viaje es: $costoTotal"),
      ),
    );
  }
}
