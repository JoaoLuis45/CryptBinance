import 'package:cryptbinance/models/moeda.dart';

class Moedarepository {
  static List<Moeda> tabela = [
    Moeda(
        nome: 'Bitcoin',
        sigla: 'BTC',
        icone: 'images/bitcoin.png',
        preco: 106432),
    Moeda(
        nome: 'Ethereum',
        sigla: 'ETH',
        icone: 'images/ethereum.png',
        preco: 39347),
    Moeda(nome: 'XRP', sigla: 'XRP', icone: 'images/xrp.png', preco: 2301),
    Moeda(
        nome: 'Cardano',
        sigla: 'CRD',
        icone: 'images/cardano.png',
        preco: 7489),
    Moeda(
        nome: 'USD Coin',
        sigla: 'USD',
        icone: 'images/usd-coin.png',
        preco: 1506),
    Moeda(
        nome: 'Litecoin',
        sigla: 'LTC',
        icone: 'images/litecoin.png',
        preco: 303),
  ];
}
