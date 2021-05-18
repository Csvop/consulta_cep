import 'package:flutter/material.dart';
import 'cep.dart';

class CepDetails extends StatelessWidget {
  final Cep cep;

  CepDetails({Key key, this.cep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Icon(Icons.location_history)),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  cep.cep,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                  //padding: const EdgeInsets.only(bottom: 8),
                  child: Column(children: [
                ListTile(
                    leading: Icon(Icons.location_history),
                    title: Text(
                        "{cep.logradouro} {cep.complemento}, Bairro {cep.bairro}\n{cep.localidade} - {cep.uf}"),
                    subtitle: Text(cep.logradouro,
                        style: TextStyle(color: Colors.grey[500]))),
                ListTile(
                    leading: Icon(Icons.location_history),
                    title: Text("IBGE"),
                    subtitle: Text(cep.ibge,
                        style: TextStyle(color: Colors.grey[500]))),
                ListTile(
                    leading: Icon(Icons.location_history),
                    title: Text("GIA"),
                    subtitle: Text(cep.gia,
                        style: TextStyle(color: Colors.grey[500]))),
                ListTile(
                    leading: Icon(Icons.location_history),
                    title: Text("DDD"),
                    subtitle: Text(cep.ddd,
                        style: TextStyle(color: Colors.grey[500]))),
                ListTile(
                    leading: Icon(Icons.location_history),
                    title: Text("SIAFI"),
                    subtitle: Text(cep.siafi,
                        style: TextStyle(color: Colors.grey[500])))
              ]))
            ],
          )),
    );
  }
}
