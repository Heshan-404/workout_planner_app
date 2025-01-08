import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';

class DateTimeSection extends StatelessWidget {
  final DateFormat dateFormat = DateFormat('EEEE , MMMM');
  final DateFormat dayFormat = DateFormat("dd");
  final String title;

  DateTimeSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = dateFormat.format(now);
    String formattedDay = dayFormat.format(now);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$formattedDate $formattedDay".toUpperCase(),
          style: const TextStyle(
            color: kMainGreyColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: kMainBlackColor,
            fontSize: 40,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
