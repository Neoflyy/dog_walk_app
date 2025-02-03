import 'package:dog_walk_app/src/data/models/hour_model.dart';
import 'package:dog_walk_app/ui_kit/ui_kit.dart';
import 'package:dog_walk_app/ui_kit/widgets/warning_text.dart';
import 'package:flutter/material.dart';

class ServiceBlock extends StatelessWidget {
  const ServiceBlock({
    super.key,
    this.title,
    required this.hours,
    required this.warningText,
  });
  final List<HourModel> hours;
  final String? title;
  final String warningText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: TextStyles.bodySmall.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.greyTextColor,
            ),
          ),
          const SizedBox(height: 10),
        ],
        ...List.generate(
          hours.length,
          (i) {
            final el = hours[i];
            final bool isBooked = el.isBooked;

            TextStyle style = TextStyles.h2.copyWith(
                color: _getColor(isBooked), fontWeight: FontWeight.w600);
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('${el.day}: ${el.from} - ${el.to}', style: style),
                if (isBooked) ...[
                  const SizedBox(width: 25),
                  Text(
                    'Booked',
                    style: TextStyles.bodySmall.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ]
              ],
            );
          },
        ),
        const SizedBox(height: 17),
        WarningText(
          warningText: warningText,
        ),
      ],
    );
  }

  Color _getColor(bool isBooked) {
    return isBooked ? AppColors.greyTextColor : AppColors.darkTextColor;
  }
}
