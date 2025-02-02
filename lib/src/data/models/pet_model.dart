import 'package:dog_walk_app/src/data/models/service_model.dart';
import 'package:equatable/equatable.dart';

class PetModel extends Equatable {
  const PetModel({
    required this.id,
    required this.name,
    required this.availability,
    required this.service,
    required this.image,
  });
  final int id;
  final String name;
  final String availability;
  final ServiceModel service;
  final String image;

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      id: json['id'],
      name: json['name'],
      availability: json['availability'],
      service: ServiceModel.fromJson(json['service']),
      image: json['image'],
    );
  }

  @override
  List<Object?> get props => [id, name, availability, service, image];
}
