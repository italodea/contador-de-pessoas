import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    title: "Contador de pessoas",
    home: Home()
      
  ));
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoas = 0;
  String _mensagem = "Vazio, pode entrar!";

  void _mudarPessoas(int delta){
    setState(() {
      _pessoas += delta;
    });
  }
  void _checarPessoas(){
    if (_pessoas >= 10){
      setState(() {
        _pessoas = 10;
        _mensagem = "Esta lotado!";
      });
    }else if(_pessoas <= 0){
      setState(() {
        _pessoas = 0;
        _mensagem = "Vazio. pode entrar!";
      });

    }
    else{
      setState(() {
        _mensagem = "Pode entrar!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Image.asset(
            "images/restaurant.jpg",
            fit: BoxFit.cover,
            height: 1000.0,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Pessoas: $_pessoas",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child:
                      FlatButton(
                        child: Text("+1",style: TextStyle(fontSize: 40.0, color: Colors.white),
                        ),
                        onPressed: (){
                          _mudarPessoas(1);
                          _checarPessoas();
                          debugPrint("+1");
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child:
                      FlatButton(
                        child: Text("-1",style: TextStyle(fontSize: 40.0, color: Colors.white),
                        ),
                        onPressed: (){
                          _mudarPessoas(-1);
                          _checarPessoas();
                          debugPrint("-1");
                        },
                      ),
                    ),
                  ],
                ),
                Text("$_mensagem",
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 30.0),
                )
              ]
          )
        ]
    );
  }
}
