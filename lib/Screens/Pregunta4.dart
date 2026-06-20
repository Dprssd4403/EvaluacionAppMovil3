import 'dart:convert';

import 'package:evaluacion1/navigations/NavegadorDraver.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Pagina4 extends StatefulWidget {
  const Pagina4({super.key});

  @override
  State<Pagina4> createState() => _Pagina4State();
}

class _Pagina4State extends State<Pagina4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de datos")),
      body: Column(
        children: [
          Text("Lista musica"),
          Flexible(child: listaDatos()),
        ],
      ),
      drawer: MiDrawer(),
    );
  }
}

Future<List<dynamic>> leer(String url) async {
  final respuesta = await http.get(Uri.parse(url));

  return json.decode(respuesta.body);
}

Widget listaDatos() {
  String url = "https://jritsqmet.github.io/web-api/assets/json/musica2.json";
  return FutureBuilder(
    future: leer(url),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final data = snapshot.data!;
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];
            return Card(
              color: const Color.fromARGB(216, 145, 138, 118),
              child: ListTile(
                title: Text(item['title']),
                subtitle: Text("${item['artist']['name']}"),
                leading: Image.network(item['media']['cover_image']),
                onTap: () => verMas(context, item),
                trailing: IconButton(
                  onPressed: () => (),
                  icon: Icon(Icons.arrow_right_rounded),
                ),
              ),
            );
          },
        );
      } else {
        return (CircularProgressIndicator());
      }
    },
  );
}

void verMas(BuildContext context, item) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(item['title']),
      content: Column(
        children: [
          Image.network(item['media']['cover_image']),
          Text("Artista: ${item['artist']['name']}"),
          Text("Álbum: ${item['album']['title']}"),
          Text("Duración: ${item['duration']} min"),
          Text("Género: ${item['artist']['genre']}"),
        ],
      ),
    ),
  );
}
