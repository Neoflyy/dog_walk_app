part of 'pets_cubit.dart';

@freezed
class PetsState with _$PetsState {
  const PetsState._();
  const factory PetsState({
    @Default(Status.initial) Status status,
    @Default([]) List<PetModel> pets,
  }) = _PetsState;
}
