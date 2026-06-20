import 'package:evaluacion1/Screens/Pregunta2.dart';
import 'package:evaluacion1/Screens/Pregunta3.dart';
import 'package:evaluacion1/Screens/Pregunta4.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Evaluacion());
}

class Evaluacion extends StatelessWidget {
  const Evaluacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Cuerpo());
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Evaluacion")),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Column(children: [Text("Evaluacion")])),

            ListTile(
              title: Text("Pagina 1"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Pregunta2()),
              ),
            ),

            ListTile(
              title: Text("Pagina 2"),
              onTap: () =>Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Pregunta3()),
              ),
            ),
             ListTile(
              title: Text("Pagina 4"),
              onTap: () =>Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Pagina4()),
              ),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          btnInformacion(context),
          Flexible(child: img1()),
        ],
      ),
    );
  }
}

Widget img1() {
  return (Image.asset("assets/image/radagon.jpg"));
}

Widget btnInformacion(BuildContext context) {
  return (FilledButton(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Colors.indigoAccent),
    ),
    onPressed: () => informacion(context),
    child: Text("Informacion", style: TextStyle(fontSize: 20)),
  ));
}

void informacion(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Título: Ejercicios de Programacion"),
      content: Column(
        children: [
          Text("Programador: Juan Paz"),
          Text("Carrera: Desarrollo de Software"),
        ],
      ),
    ),
  );
}
