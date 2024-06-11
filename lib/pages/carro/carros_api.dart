import 'package:flutter/services.dart';
import 'dart:convert';
import 'carro.dart';

class CarrosApi {
  static Future<List<Carro>> getCarros() async {
    try {
      // Carregar o arquivo JSON
      String jsonString = await rootBundle.loadString('assets/mockData.json');
      List<dynamic> jsonResponse = json.decode(jsonString);

      final List<Carro> carros = jsonResponse.map((map) => Carro.fromJson(map)).toList();
      
      return carros;
    } catch (error) {
      print("Erro ao carregar dados: $error");
      throw error;
    }
  }
}
