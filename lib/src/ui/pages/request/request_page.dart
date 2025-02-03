import 'package:dog_walk_app/src/data/models/models.dart';
import 'package:dog_walk_app/src/ui/widgets/widgets.dart';
import 'package:dog_walk_app/ui_kit/ui_kit.dart';
import 'package:dog_walk_app/ui_kit/widgets/warning_text.dart';
import 'package:flutter/material.dart';

String _defaultControllerText =
    'Hi David, I\'m Liza and I would love to join Gnocchi\'s morning walk. I have good references on my profile. Please check it out before you decide. I\'m looking forward to meet you both! Liza.';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key, required this.pet});

  final PetModel pet;

  static const path = 'request_page';
  static const name = 'RequestPage';

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
    const String warningText1 =
        'Please note that, this service is not one-time. It will occur in every week.';
    const String warningText2 =
        'Your wage will be transfer to your account as soon as you complete your daily service. You will earn \$ 36 / per week.';

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
                widget.pet.image,
                width: double.infinity,
                height: 375,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 78,
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
                      'Please complete and confirm the information below.',
                      style: TextStyles.h2.copyWith(
                          color: AppColors.darkTextColor,
                          fontWeight: FontWeight.w600),
                    ),
                    defaultMargin,
                    InfoColumn(
                      title: 'LOCATION',
                      widget: Text(
                        widget.pet.location,
                        style: style,
                      ),
                    ),
                    defaultMargin,
                    InfoColumn(
                      title: 'SERVICE TYPE',
                      widget: Text(
                        widget.pet.service.name,
                        style: style,
                      ),
                      icon: widget.pet.service.icon,
                    ),
                    defaultMargin,
                    _ServiceCheck(
                      hours: widget.pet.service.hours,
                      title: 'SERVICE HOURS',
                    ),
                    const SizedBox(height: 16),
                    const WarningText(warningText: warningText1),
                    defaultMargin,
                    InfoColumn(
                      title: 'SERVICE FEE',
                      widget: Text(
                        '\$ ${widget.pet.service.price} / hr',
                        style: style,
                      ),
                    ),
                    defaultMargin,
                    _ServiceFeeCalculation(
                      hours: widget.pet.service.hours,
                      price: widget.pet.service.price,
                    ),
                    const SizedBox(height: 16),
                    const WarningText(warningText: warningText2),
                    defaultMargin,
                    const InfoColumn(
                      title: 'YOUR PROFILE:',
                      widget: AvatarColumn(
                        img: Assets.yourProfile,
                        name: 'Liza Kimberley',
                      ),
                    ),
                    defaultMargin,
                    InfoColumn(
                      title: 'ANY NOTE?',
                      widget: _TextFieldWidget(),
                    ),
                    defaultMargin,
                    Row(
                      children: [
                        Expanded(
                          child: AppButton.filled(
                              content: Text(
                                'Send the Request',
                                style: TextStyles.bodyXXLarge.copyWith(
                                  color: AppColors.surface,
                                ),
                              ),
                              onPressed: () {}),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 16,
            right: 16,
            child: NavigationHeader(
              isSaved: widget.pet.isSaved,
            ),
          ),
        ],
      ),
    );
  }
}

class _TextFieldWidget extends StatefulWidget {
  const _TextFieldWidget();

  @override
  State<_TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<_TextFieldWidget> {
  final TextEditingController _controller =
      TextEditingController(text: _defaultControllerText);
  int _charCount = _defaultControllerText.length;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _charCount = _controller.text.length;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      maxLength: 500,
      decoration: InputDecoration(counterText: '$_charCount / 500'),
      controller: _controller,
      style: TextStyles.bodyMedium.copyWith(overflow: TextOverflow.ellipsis),
    );
  }
}

class _ServiceCheck extends StatefulWidget {
  const _ServiceCheck({required this.hours, required this.title});

  final List<HourModel> hours;
  final String title;

  @override
  State<_ServiceCheck> createState() => _ServiceCheckState();
}

class _ServiceCheckState extends State<_ServiceCheck> {
  late List<bool> _checkboxStates;

  @override
  void initState() {
    super.initState();
    _checkboxStates = List.generate(widget.hours.length, (index) => true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: TextStyles.bodySmall.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.greyTextColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...List.generate(widget.hours.length, (i) {
          final element = widget.hours[i];

          return Container(
            margin: const EdgeInsets.only(right: 30),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(
                    checkColor: AppColors.surface,
                    fillColor:
                        const WidgetStatePropertyAll(AppColors.onSurface),
                    value: _checkboxStates[i],
                    onChanged: (e) {
                      setState(() {
                        _checkboxStates[i] = !_checkboxStates[i];
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  '${element.day}: ${element.from} - ${element.to}',
                  style: TextStyles.h2.copyWith(
                      color: AppColors.darkTextColor,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          );
        })
      ],
    );
  }
}

class _ServiceFeeCalculation extends StatefulWidget {
  const _ServiceFeeCalculation({required this.hours, required this.price});

  final List<HourModel> hours;
  final int price;

  @override
  State<_ServiceFeeCalculation> createState() => _ServiceFeeCalculationState();
}

class _ServiceFeeCalculationState extends State<_ServiceFeeCalculation> {
  late int sum;

  @override
  void initState() {
    super.initState();
    sum = widget.hours.length * widget.price;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(widget.hours.length, (i) {
          final index = widget.hours[i];
          return Row(
            children: [
              Text('${index.day}: ${index.from} - ${index.to}'),
              const Spacer(),
              Text(
                '\$ ${widget.price}',
                style: TextStyles.h2.copyWith(
                    color: AppColors.darkTextColor,
                    fontWeight: FontWeight.w600),
              )
            ],
          );
        }),
        const SizedBox(height: 8),
        const Divider(
          thickness: 0.5,
        ),
        Row(
          children: [
            Text(
              'Total:',
              style: TextStyles.h2.copyWith(
                  color: AppColors.darkTextColor, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Text(
              '\$ $sum',
              style: TextStyles.h1.copyWith(
                  color: AppColors.darkTextColor, fontWeight: FontWeight.w600),
            )
          ],
        )
      ],
    );
  }
}
