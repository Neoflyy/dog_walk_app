import 'package:dog_walk_app/src/data/models/service_model.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class PetModel extends Equatable {
  const PetModel({
    required this.id,
    required this.name,
    required this.owner,
    required this.contact,
    required this.ownerImage,
    required this.availability,
    required this.service,
    required this.image,
    required this.isSaved,
    required this.age,
    required this.size,
    required this.sex,
    required this.location,
  });

  final int id;
  final String name;
  final String owner;
  final String contact;
  final String ownerImage;
  final String availability;
  final ServiceModel service;
  final String image;
  final bool isSaved;
  final String age;
  final String size;
  final String sex;
  final String location;

  String get ageFormatted {
    try {
      final birthDate = DateFormat('yyyy/MM/dd').parse(age);
      final today = DateTime.now();
      final years = today.year - birthDate.year;
      final months = today.month - birthDate.month;

      if (years == 0) {
        return '${(months < 0 ? (months + 12) : months)} months';
      } else {
        return '$years ${years == 1 ? 'year' : 'years'}';
      }
    } catch (e) {
      return 'Unknown';
    }
  }

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      id: json['id'],
      name: json['name'],
      owner: json['owner'],
      ownerImage: json['ownerImage'],
      contact: json['contact'],
      availability: json['availability'],
      service: ServiceModel.fromJson(json['service']),
      image: json['image'],
      isSaved: json['isSaved'] ?? false,
      age: json['age'] ?? '',
      size: json['size'] ?? '',
      sex: json['sex'] ?? '',
      location: json['location'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        availability,
        owner,
        ownerImage,
        service,
        image,
        isSaved,
        age,
        size,
        sex,
        location
      ];
}
