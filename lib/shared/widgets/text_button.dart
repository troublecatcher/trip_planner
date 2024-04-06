import 'package:flutter/cupertino.dart';

class CTextButton extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const CTextButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
