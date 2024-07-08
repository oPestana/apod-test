import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'details_picture.dart';

class PictureListPage extends StatefulWidget {
  const PictureListPage({super.key});

  @override
  State<PictureListPage> createState() => _PictureListPageState();
}

class _PictureListPageState extends State<PictureListPage> {
  Future<List> getData() async {
    http.Response response;
    final url = Uri.parse(
        'https://api.nasa.gov/planetary/apod?count=5&api_key=6MZbidRebIh1HtWdJOAbwDAIbcQrwGnXh3f4Ahoq');
    response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Astronomy Picture of the Day'),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: 'Pesquise por nome',
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Container(
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    );
                  default:
                    final data = snapshot.data!;
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = data[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPicture(
                                  picture: item,
                                ),
                              ),
                            );
                          },
                          child: Card(
                            color: Colors.grey,
                            child: Column(
                              children: [
                                Image.network(item['url'], fit: BoxFit.cover),
                                Text(
                                  item['title'],
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text(
                                  item['date'],
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
