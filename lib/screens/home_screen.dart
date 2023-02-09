import 'dart:async';

import 'package:crypto_list/screens/crypto_details.dart';
import 'package:crypto_list/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class HomeSreen extends StatefulWidget {
  const HomeSreen({super.key});

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff252529),
        appBar: AppBar(
          title: const Text(
            'CRYPTO NATION',
          ),
          backgroundColor: Colors.green[900],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: const [
                  Card(
                    color: Colors.black,
                    child: Text('data'),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: FutureBuilder(
                future: getCoinsLists(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CryptoDetailsScreen(
                                    details: snapshot.data[index]),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.black26,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.network(
                                              snapshot.data[index]['image'],
                                              height: 50,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data[index]['name'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              snapshot.data[index]['symbol']
                                                  .toString()
                                                  .toUpperCase(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white54,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '\u{20B9}${snapshot.data[index]['current_price'].toString()}',
                                      style: const TextStyle(
                                        color: Colors.white54,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${snapshot.data[index]['price_change_percentage_24h'].toString()}\u{0025}',
                                          style: TextStyle(
                                            color: (snapshot.data[index]
                                                        ['current_price'] >
                                                    snapshot.data[index]
                                                        ['price_change_24h'])
                                                ? Colors.red
                                                : Colors.green,
                                          ),
                                        ),
                                        Icon(
                                          (snapshot.data[index]
                                                      ['price_change_24h'] <
                                                  snapshot.data[index]
                                                      ['current_price'])
                                              ? Icons.trending_down
                                              : Icons.trending_up_outlined,
                                          color: (snapshot.data[index]
                                                      ['current_price'] >
                                                  snapshot.data[index]
                                                      ['price_change_24h'])
                                              ? Colors.red
                                              : Colors.green,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: Lottie.asset('assets/crypto.json'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
