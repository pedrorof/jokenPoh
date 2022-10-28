import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: homepage(),
  ));
}

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    //exibição da imagem escolhida pelo App
    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    //validação resultado
    //usuario ganhou
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel")) {
      setState(() {
        this._mensagem = "PARABENNNS!! Você ganhou";
      });
      //appganhador
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel")) {
      setState(() {
        this._mensagem = "Você perdeu, mais sorte na próxima";
      });
      //empate

    } else {
      setState(() {
        this._mensagem = "EMPATE, TENTE DE NOVO";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedra Papel Tesoura"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //1) Text
          //2) imagem
          //3) text result
          //4 linha 3 imagens
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(
            image: this._imagemApp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset(
                  "images/pedra.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset(
                  "images/papel.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset(
                  "images/tesoura.png",
                  height: 100,
                ),
              ),

              /*
              ,
              ,
              */
            ],
          )
        ],
      ),
    );
  }
}
