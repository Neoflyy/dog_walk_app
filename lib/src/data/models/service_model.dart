import 'package:dog_walk_app/src/data/models/models.dart';
import 'package:equatable/equatable.dart';

class ServiceModel extends Equatable {
  final int id;
  final String name;
  final String icon;
  final String detail;
  final int price;
  final List<HourModel> hours;

  const ServiceModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.price,
    required this.detail,
    required this.hours,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    var list = json['hours'] as List;
    List<HourModel> hourList = list.map((i) => HourModel.fromJson(i)).toList();

    return ServiceModel(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      detail: json['detail'],
      price: json['price'],
      hours: hourList,
    );
  }

  @override
  List<Object?> get props => [id, name, icon, price, hours];
}
