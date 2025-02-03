import 'package:dog_walk_app/commons/enums.dart';
import 'package:dog_walk_app/src/cubit/pets_cubit/pets_cubit.dart';
import 'package:dog_walk_app/src/data/models/pet_model.dart';
import 'package:dog_walk_app/src/data/repositories/pets_repository.dart';
import 'package:dog_walk_app/src/ui/pages/detail/detail_page.dart';
import 'package:dog_walk_app/src/ui/widgets/widgets.dart';
import 'package:dog_walk_app/ui_kit/ui_kit.dart';
import 'package:dog_walk_app/ui_kit/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PetsCubit(
        petsRepository: context.read<PetsRepository>(),
      )..fetchPets(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> _labelList = [
      'Price hourly: min \$10',
      'Small dogs',
    ];

    return RefreshIndicator.adaptive(
      onRefresh: () {
        return context.read<PetsCubit>().fetchPets();
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        color: AppColors.primaryBackground,
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          children: [
            Row(
              children: [
                for (final label in _labelList) TagWidget(label: label),
              ],
            ),
            Expanded(
              child: BlocBuilder<PetsCubit, PetsState>(
                builder: (context, state) {
                  if (state.status == Status.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state.status == Status.success && state.pets.isNotEmpty) {
                    return ListView.builder(
                      controller: ScrollController(),
                      itemCount: state.pets.length + 1,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        if (index == state.pets.length) {
                          return const SizedBox(height: 100);
                        }
                        final PetModel pet = state.pets[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: AppCard(
                            image: pet.image,
                            isSaved: pet.isSaved,
                            content: _PetContentWidget(
                              title: pet.name,
                              price: pet.service.price.toString(),
                              serviceName: pet.service.name,
                              availability: pet.availability,
                              icon: pet.service.icon,
                            ),
                            onTap: () {
                              _onCardPressed(context, pet);
                            },
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text('No pets found'),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onCardPressed(BuildContext context, PetModel pet) {
    Navigator.pushNamed(context, DetailPage.path, arguments: {'pet': pet});
  }
}

class _PetContentWidget extends StatelessWidget {
  const _PetContentWidget(
      {required this.title,
      required this.availability,
      required this.serviceName,
      required this.price,
      required this.icon});

  final String title;
  final String availability;
  final String serviceName;
  final String price;
  final String icon;

  @override
  Widget build(BuildContext context) {
    final [day, time] = availability.split(' ');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.bodyXLarge.copyWith(color: AppColors.surface),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '$day ',
              style: TextStyles.h2.copyWith(color: AppColors.surface),
            ),
            Container(
              width: 1,
              height: 20,
              color: AppColors.surface,
            ),
            Text(
              ' $time',
              style: TextStyles.h2.copyWith(color: AppColors.surface),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIcon(icon: icon),
            const SizedBox(width: 8),
            Text(
              serviceName,
              style: TextStyles.bodySmall.copyWith(
                  color: AppColors.surface, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Text(
              '\$ $price / hr',
              style: TextStyles.bodyXLarge.copyWith(color: AppColors.surface),
            )
          ],
        )
      ],
    );
  }
}
