import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = 'B0EABEE0-CE43-424E-87C5-3695D6A350F1';
const coinApiUrl = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future getCoinData() async {
    String url = '$coinApiUrl/BTC/USD?apikey=$apiKey';
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var rate = decodedData['rate'];
      return rate;
    } else {
      print(response.statusCode);
      throw ('Problem sa pribavljanjem podataka.');
    }
  }
}
