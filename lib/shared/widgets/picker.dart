import 'package:flutter/cupertino.dart';
import 'package:trip_planner/app/theme.dart';

class CPicker extends StatelessWidget {
  final Function(DateTime) onSave;
  final DateTime initDate;
  final DateTime? minDate;
  final DateTime? maxDate;

  const CPicker({
    super.key,
    required this.onSave,
    required this.initDate,
    this.minDate,
    this.maxDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(36, 36, 36, 1),
      height: MediaQuery.of(context).size.height / 2,
      child: CupertinoDatePicker(
        use24hFormat: true,
        onDateTimeChanged: onSave,
        initialDateTime: initDate,
        minimumDate: minDate,
        maximumDate: maxDate,
      ),
    );
  }
}
