import 'package:dog_walk_app/src/data/models/pet_model.dart';
import 'package:dog_walk_app/src/ui/pages/pages.dart';
import 'package:dog_walk_app/src/ui/widgets/app_scaffold.dart';
import 'package:dog_walk_app/ui_kit/ui_kit.dart';
import 'package:dog_walk_app/ui_kit/widgets/app_button.dart';
import 'package:dog_walk_app/ui_kit/widgets/service_block.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.pet});

  static const path = 'detail_page';
  static const name = 'DetailPage';

  final PetModel pet;

  @override
  Widget build(BuildContext context) {
    const String warningText =
        'Please note that, this service is not one-time. It will occur in every week.';

    final Map<String, String> infoList = {
      'AGE': pet.ageFormatted,
      'SIZE': pet.size,
      'SEX': pet.sex,
    };

    SizedBox defaultMargin = const SizedBox(
      height: 24,
    );

    final TextStyle style = TextStyles.h2
        .copyWith(fontWeight: FontWeight.w600, color: AppColors.darkTextColor);

    return AppScaffold(
      hasNavBar: false,
      body: Stack(
        children: [
          ClipRect(
            child: Align(
              alignment: Alignment.center,
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Image.asset(
                pet.image,
                width: double.infinity,
                height: 375,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 330,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                decoration: const BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pet.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    defaultMargin,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(infoList.length, (index) {
                        return _DogInfo(
                          title: infoList.entries.elementAt(index).key,
                          info: infoList.entries.elementAt(index).value,
                        );
                      }),
                    ),
                    defaultMargin,
                    InfoColumn(
                      title: 'LOCATION',
                      widget: Text(
                        pet.location,
                        style: style,
                      ),
                    ),
                    defaultMargin,
                    InfoColumn(
                      title: 'SERVICE TYPE',
                      widget: Text(
                        pet.service.name,
                        style: style,
                      ),
                      icon: pet.service.icon,
                    ),
                    defaultMargin,
                    ServiceBlock(
                      warningText: warningText,
                      title: 'SERVICE HOURS',
                      hours: pet.service.hours,
                    ),
                    defaultMargin,
                    InfoColumn(
                      title: 'SERVICE FEE',
                      widget: Text(
                        '\$ ${pet.service.price} / hr',
                        style: style,
                      ),
                    ),
                    defaultMargin,
                    InfoColumn(
                        title: 'DETAILS',
                        widget: Text(
                          pet.service.detail,
                          style: style,
                        )),
                    defaultMargin,
                    InfoColumn(
                      title: 'HER HUMAN',
                      widget: AvatarColumn(
                        contact: pet.contact,
                        name: pet.owner,
                        img: pet.ownerImage,
                      ),
                    ),
                    defaultMargin,
                    Row(
                      children: [
                        AppButton.outline(
                            content: const Icon(
                              Icons.chat_bubble_outline,
                              color: AppColors.onSurface,
                            ),
                            onPressed: () {}),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: AppButton.filled(
                                content: Text(
                                  'Create A Request',
                                  style: TextStyles.bodyXXLarge.copyWith(
                                    color: AppColors.surface,
                                  ),
                                ),
                                onPressed: () {
                                  _onButtonPressed(context, pet);
                                }))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 300,
            right: 40,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18, vertical: 14.2),
              decoration: BoxDecoration(
                color: AppColors.surface,
                border: Border.all(color: AppColors.darkTextColor, width: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '\$${pet.service.price} / hr',
                style: TextStyles.h1.copyWith(fontWeight: FontWeight.w900),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 16,
            right: 16,
            child: NavigationHeader(
              isSaved: pet.isSaved,
            ),
          ),
        ],
      ),
    );
  }

  void _onButtonPressed(BuildContext context, PetModel pet) {
    Navigator.pushNamed(context, RequestPage.path, arguments: {'pet': pet});
  }
}

class _DogInfo extends StatelessWidget {
  const _DogInfo({
    required this.title,
    required this.info,
  });

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.bodySmall.copyWith(
              fontWeight: FontWeight.bold, color: AppColors.greyTextColor),
        ),
        Text(
          info,
          style: TextStyles.h2.copyWith(
              fontWeight: FontWeight.w600, color: AppColors.darkTextColor),
        ),
      ],
    );
  }
}
