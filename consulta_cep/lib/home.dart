import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Consulta CEP App',
        )),
        body: Padding(
          padding: EdgeInsets.all(50.0),
          child: Center(
              child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                    decoration: InputDecoration(
                  icon: Icon(Icons.location_history),
                  hintText: 'Insira o seu CEP...',
                  labelText: 'Seu CEP',
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                )),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onSurface: Colors.grey,
                    elevation: 20,
                    minimumSize: Size(150, 50),
                  ),
                  child: Text('Buscar'),
                  onPressed: () {
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                    decoration: InputDecoration(
                  icon: Icon(Icons.map_outlined),
                  hintText: 'Insira o seu endereço...',
                  labelText: 'Seu Endereço',
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                )),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onSurface: Colors.grey,
                    elevation: 20,
                    minimumSize: Size(150, 50),
                  ),
                  child: Text('Buscar'),
                  onPressed: () {
                  },
                ),
              ],
            ),
          )),
        ));
  }
}
