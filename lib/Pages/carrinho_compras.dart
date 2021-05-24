import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loja_alura/main.dart';
import 'package:loja_alura/widgets/appbar_customizada.dart';
import 'package:loja_alura/widgets/lista_carrinho.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  final formatacaoReais = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  @override
  Widget build(BuildContext context) {
    int valorTotal = _calcularTotal();
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 80,
        padding: EdgeInsets.all(21),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total', style: Theme.of(context).textTheme.headline4),
            Text(formatacaoReais.format(valorTotal),
                style: Theme.of(context).textTheme.headline5),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200],
      appBar: AppBarCustomizada(
        titulo: 'Carrinho',
        ehPaginaCarrinho: true,
      ),
      body: _construirTela(),
    );
  }

  void atualiza() {
    setState(() {});
  }

  int _calcularTotal() {
    if (Inicio.itensCarrinho.isNotEmpty) {
      return Inicio.itensCarrinho
          .map((item) => item.movel.preco * item.quantidade)
          .reduce((precoAtual, precoNovo) => precoAtual + precoNovo);
    }
    return 0;
  }

  Widget _construirTela() {
    if (Inicio.itensCarrinho.isNotEmpty) {
      return ListaCarrinho(
        atualiza: atualiza,
      );
    } else {
      return Container(
        height: double.infinity,
        alignment: Alignment.center,
        child: Text(
          'Nenhum item no carrinho',
        ),
      );
    }
  }
}
