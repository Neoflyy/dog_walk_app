import 'package:dog_walk_app/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class AvatarColumn extends StatelessWidget {
  const AvatarColumn({
    super.key,
    required this.img,
    required this.name,
    this.contact,
  });
  final String img;
  final String name;
  final String? contact;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          foregroundImage: AssetImage(img),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyles.bodyLarge.copyWith(
                color: AppColors.darkTextColor,
              ),
            ),
            if (contact != null)
              Text(
                contact!,
                style: TextStyles.bodySmall.copyWith(
                  color: AppColors.greyTextColor,
                ),
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.star,
                    color: AppColors.warning,
                  ),
                  Text(
                    '4.9',
                    style: TextStyles.caption
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text('(543 votes)', style: TextStyles.caption)
                ],
              ),
          ],
        )
      ],
    );
  }
}
