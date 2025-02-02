import 'dart:convert';

import 'package:dog_walk_app/commons/mock_http/mock_api.dart';
import 'package:dog_walk_app/src/data/models/pet_model.dart';
import 'package:flutter/services.dart';

abstract class PetsLocalDataSource {
  Future<List<PetModel>> getPetsFromJson();
}

class PetsLocalDataSourceImpl implements PetsLocalDataSource {
  @override
  Future<List<PetModel>> getPetsFromJson() async {
    final String response = await rootBundle.loadString(MockApi.petUrl);
    List<dynamic> jsonList = json.decode(response);
    return jsonList.map((json) => PetModel.fromJson(json)).toList();
  }
}
