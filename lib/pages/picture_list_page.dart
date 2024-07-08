import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'details_picture_page.dart';

class PictureListPage extends StatefulWidget {
  const PictureListPage({super.key});

  @override
  State<PictureListPage> createState() => _PictureListPageState();
}

class _PictureListPageState extends State<PictureListPage> {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final TextEditingController _searchController = TextEditingController();
  List _data = [];
  List _filteredData = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterData);
    getData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterData() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredData = _data.where((item) {
        final title = item['title'].toLowerCase();
        return title.contains(query);
      }).toList();
    });
  }

  Future<void> getData() async {
    try {
      _data = await fetchFromApi();
      await saveData(_data);
    } catch (e) {
      _data = await readData();
    }
    _filterData(); // Apply filter after fetching data
  }

  Future<List> fetchFromApi() async {
    const key = '6MZbidRebIh1HtWdJOAbwDAIbcQrwGnXh3f4Ahoq';
    final url = Uri.parse('https://api.nasa.gov/planetary/apod?count=5&api_key=$key');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Erro ao carregar dados');
    }
  }

  Future<void> saveData(List data) async {
    await _secureStorage.write(key: 'apodData', value: json.encode(data));
  }

  Future<List> readData() async {
    final String? data = await _secureStorage.read(key: 'apodData');
    if (data != null) {
      return json.decode(data);
    } else {
      throw Exception('Opa! Não existem dados.');
    }
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
          TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search_rounded),
              labelText: 'Pesquise por nome',
              labelStyle: TextStyle(color: Colors.white),
            ),
            style: const TextStyle(color: Colors.white),
          ),
          Expanded(
            child: _data.isEmpty
                ? Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            )
                : ListView.builder(
              itemCount: _filteredData.length,
              itemBuilder: (BuildContext context, int index) {
                final item = _filteredData[index];
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
            ),
          ),
        ],
      ),
    );
  }
}