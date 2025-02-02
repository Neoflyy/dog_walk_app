import 'package:dog_walk_app/commons/enums.dart';
import 'package:dog_walk_app/src/data/models/pet_model.dart';
import 'package:dog_walk_app/src/data/repositories/pets_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pets_state.dart';
part 'pets_cubit.freezed.dart';

class PetsCubit extends Cubit<PetsState> {
  PetsCubit({
    required PetsRepository petsRepository,
  })  : _petsRepository = petsRepository,
        super(const PetsState());

  final PetsRepository _petsRepository;

  Future<void> fetchPets() async {
    emit(state.copyWith(status: Status.loading));
    //fake response time
    await Future.delayed(const Duration(seconds: 2));

    final response = await _petsRepository.getPets();
    //logic for response

    emit(state.copyWith(pets: response, status: Status.success));
  }
}
