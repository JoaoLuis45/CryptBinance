// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cryptbinance/pages/detalhespage.dart';
import 'package:cryptbinance/repositories/moedarepository.dart';
import 'package:flutter/material.dart';
import 'package:cryptbinance/models/moeda.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final tabela = Moedarepository.tabela;

  List<Moeda> selecionadas = [];

  NumberFormat real = NumberFormat.currency(locale: 'pt-BR', name: 'R\$');

  dynamicAppBar() {
    if (selecionadas.isEmpty) {
      return AppBar(
        title: Center(
            child: Text(
          'Crypt Binance',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )),
        backgroundColor: Colors.blue,
      );
    } else {
      return AppBar(
        title: Text(
          '${selecionadas.length} Selecionadas',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 186, 205, 215),
        iconTheme: IconThemeData(color: Colors.black87),
        leading: IconButton(
          onPressed: () {
            setState(() {
              selecionadas = [];
            });
          },
          icon: Icon(Icons.arrow_back),
        ),
      );
    }
  }

  mostrarDetalhes(Moeda moeda) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Detalhespage(moeda: moeda),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dynamicAppBar(),
      body: ListView.separated(
          padding: EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return ListTile(
              leading: (selecionadas.contains(tabela[index]))
                  ? CircleAvatar(
                      child: Icon(Icons.check),
                    )
                  : SizedBox(
                      child: Image(image: AssetImage(tabela[index].icone)),
                      width: 50,
                    ),
              title: Text(
                tabela[index].nome,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                real.format(tabela[index].preco),
                style: TextStyle(fontSize: 14),
              ),
              selected: selecionadas.contains(tabela[index]),
              selectedColor: Colors.blue,
              selectedTileColor: Colors.indigo.withOpacity(0.2),
              contentPadding: EdgeInsets.all(5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              onLongPress: () {
                setState(() {
                  (selecionadas.contains(tabela[index]))
                      ? (selecionadas.remove(tabela[index]))
                      : (selecionadas.add(tabela[index]));
                });
              },
              onTap: () => mostrarDetalhes(tabela[index]),
            );
          },
          separatorBuilder: (_, __) => Divider(),
          itemCount: tabela.length),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: (selecionadas.isEmpty)
          ? null
          : FloatingActionButton.extended(
              onPressed: () {},
              backgroundColor: Colors.blue,
              icon: Icon(
                Icons.star,
                color: Colors.white,
              ),
              label: Text(
                'Favoritar',
                style: TextStyle(
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
    );
  }
}
