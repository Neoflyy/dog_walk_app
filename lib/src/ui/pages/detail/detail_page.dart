import 'package:dog_walk_app/src/data/models/pet_model.dart';
import 'package:dog_walk_app/src/ui/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.pet});

  static const path = 'detail_page';
  static const name = 'DetailPage';

  final PetModel pet;

  @override
  Widget build(BuildContext context) {
    print(pet.service.hours);
    return const AppScaffold(
      hasNavBar: false,
      header: SizedBox(),
      body: Column(),
    );
  }
}
