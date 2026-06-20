import 'package:evaluacion1/Screens/Pregunta2.dart';
import 'package:evaluacion1/Screens/Pregunta3.dart';
import 'package:flutter/material.dart';

class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  Text("Evaluacion"),
                ],
              ),
            ),     
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Pregunta 2"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Pregunta2()),
              ),
            ),
            
            ListTile(
              title: Text("Pregunta 3"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Pregunta3())),
              
            ),
          ],
        ),
      );
  }
}