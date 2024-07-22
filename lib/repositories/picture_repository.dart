import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/picture_model.dart';
import '../utils/constants.dart';

class PictureRepository {
  Future<List<PictureModel>> fetchPictures() async {
    final url = Uri.parse(nasaApiUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => PictureModel.fromJson(data)).toList();
    } else {
      throw Exception('Erro ao carregar dados ${response.statusCode}');
    }
  }
}
