import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_alura/modelos/movel.dart';
import 'package:loja_alura/Pages/detalhes.dart';
import 'package:loja_alura/widgets/degrade_elemento_grid_produtos.dart';
import 'package:loja_alura/widgets/imagem_elemento_grid_produtos.dart';
import 'package:loja_alura/widgets/titulo_elemento_grid_produtos.dart';

class ElementoGridProdutos extends StatelessWidget {
  final Movel movel;
  final Function atualiza;

  ElementoGridProdutos({this.movel, this.atualiza});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detalhes(movel: movel),
          ),
        ).then((value) => atualiza());
      },
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 8,
            color: Colors.black12,
          ),
        ]),
        margin: EdgeInsets.all(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(9),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ImagemElementoGridProdutos(
                imagem: movel.foto,
              ),
              DegradeElementoGridProdutos(),
              TituloElementoGridProdutos(
                titulo: movel.titulo,
              )
            ],
          ),
        ),
      ),
    );
  }
}
