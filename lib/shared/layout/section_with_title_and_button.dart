import 'package:flutter/cupertino.dart';
import 'package:trip_planner/app/theme.dart';
import 'package:trip_planner/shared/layout/section.dart';
import 'package:trip_planner/shared/widgets/text_button.dart';

class SectionWithTitleAndButton extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final Function() onPressed;
  final Widget child;

  const SectionWithTitleAndButton({
    super.key,
    required this.title,
    required this.buttonTitle,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: titleStyle,
            ),
            CTextButton(
              title: buttonTitle,
              onPressed: onPressed,
            ),
          ],
        ),
        child,
      ],
    );
  }
}
