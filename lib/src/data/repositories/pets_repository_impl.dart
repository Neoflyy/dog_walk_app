import 'package:dog_walk_app/src/data/data_sources/pets_local_data_source.dart';
import 'package:dog_walk_app/src/data/models/pet_model.dart';
import 'package:dog_walk_app/src/data/repositories/pets_repository.dart';

class PetsRepositoryImpl implements PetsRepository {
  final PetsLocalDataSource localDataSource;

  PetsRepositoryImpl(this.localDataSource);

  @override
  Future<List<PetModel>> getPets() async {
    return await localDataSource.getPetsFromJson();
  }
}
