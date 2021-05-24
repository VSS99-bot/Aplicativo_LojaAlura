import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IndicadorBotaoCarrinho extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
