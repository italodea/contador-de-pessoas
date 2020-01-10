import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request = 'https://api.hgbrasil.com/finance?format=json&key=00bb4207';

void main() async {
  print(await getData());

  runApp(MaterialApp(
      home: Home(),
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
              )
          )
      )
  ));
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double dolar;
  double euro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Conversor USD BRL EUR"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
          future: getData(),
          // ignore: missing_return
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:

              case ConnectionState.waiting:
                return Center(
                    child: Text(
                  "Carrgando dados",
                  style: TextStyle(color: Colors.amberAccent, fontSize: 25.0),
                  textAlign: TextAlign.center,
                ));
              default:
                if (snapshot.hasError) {
                  return Center(
                      child: Text(
                    "Erro ao carregar dados",
                    style: TextStyle(color: Colors.amberAccent, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ));
                } else {
                  dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
                  euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];

                  return SingleChildScrollView(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Icon(
                          Icons.monetization_on,
                          size: 150.0,
                          color: Colors.amber,
                        ),
                        TextField(
                            style: TextStyle(color: Colors.amber),
                            decoration: InputDecoration(
                                labelText: "Reais",
                                labelStyle: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 25.0),
                                border: OutlineInputBorder(),
                                prefixText: "R\$ ",
                                prefixStyle: TextStyle(color: Colors.amber),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.amber),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amber,)
                                )
                            )
                        ),
                        Divider(),
                        TextField(
                            style: TextStyle(color: Colors.amber),
                            decoration: InputDecoration(
                                labelText: "Dolar",
                                labelStyle: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 25.0),
                                border: OutlineInputBorder(),
                                prefixText: "US\$ ",
                                prefixStyle: TextStyle(color: Colors.amber),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.amber),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amber,)
                                )
                            )
                        ),
                        Divider(),
                        TextField(
                            style: TextStyle(color: Colors.amber),
                            decoration: InputDecoration(
                                labelText: "Euros",
                                labelStyle: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 25.0),
                                border: OutlineInputBorder(),
                                prefixText: "€ ",
                                prefixStyle: TextStyle(color: Colors.amber),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.amber),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amber,)
                                )
                            )
                        ),
                      ],
                    ),
                  );
                }
            }
          }),
    );
  }
}
