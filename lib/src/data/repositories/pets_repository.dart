import 'package:dog_walk_app/src/data/models/pet_model.dart';

abstract class PetsRepository {
  Future<List<PetModel>> getPets();
}
