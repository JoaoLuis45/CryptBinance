import 'package:cryptbinance/models/moeda.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Detalhespage extends StatefulWidget {
  Moeda moeda;
  Detalhespage({super.key, required this.moeda});

  @override
  State<Detalhespage> createState() => _DetalhespageState();
}

class _DetalhespageState extends State<Detalhespage> {
  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Crypt Binance',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 60,
                    child: Image(
                      image: AssetImage(widget.moeda.icone),
                    ),
                  ),
                  Container(
                    width: 10,
                  ),
                  Text(
                    real.format(widget.moeda.preco),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1,
                    ),
                  )
                ],
              ),
            ),
            Form(
              key: _form,
              child: TextFormField(
                controller: _valor,
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Valor',
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  suffix: Text('BRL')
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
