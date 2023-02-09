import 'dart:convert';

import 'package:http/http.dart' as http;

Future getCoinsLists() async {
  String url =
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=100&page=1&sparkline=false';
  final response = await http.get(
    Uri.parse(url),
  );
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Cannot Load');
  }
}
