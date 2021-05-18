import 'dart:convert';
import 'package:consulta_cep/detailsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'cep.dart';
import 'detailsScreen.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

void fetchCep(context, String textCep) async {
  try{
    final response =
      await http.get(Uri.https('viacep.com.br', 'ws/$textCep/json'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsScreen(
            Cep.fromJson(jsonDecode(response.body))
          )
        )
      );
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  } catch(err) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("CEP não encontrado!"), duration: Duration(seconds: 3))
    );
  }
}

class _HomeState extends State<Home> {
  TextEditingController textCep = TextEditingController();

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
                  controller: textCep,
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
                    fetchCep(context, textCep.text);
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
