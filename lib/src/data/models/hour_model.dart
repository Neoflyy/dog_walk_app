import 'package:equatable/equatable.dart';

class HourModel extends Equatable {
  final String day;
  final String from;
  final String to;
  final bool isBooked;

  const HourModel({
    required this.day,
    required this.from,
    required this.to,
    required this.isBooked,
  });

  factory HourModel.fromJson(Map<String, dynamic> json) {
    return HourModel(
      day: json['day'],
      from: json['from'],
      to: json['to'],
      isBooked: json['isBooked'],
    );
  }

  @override
  List<Object?> get props => [day, from, to, isBooked];
}
