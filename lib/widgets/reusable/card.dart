import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String imgUrl;
  final String desc;

  const ItemCard({
    super.key,
    required this.title,
    required this.imgUrl,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              spreadRadius: 0.01, offset: Offset(0, 0.01), blurRadius: 0.6),
        ],
        color: kCardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      width: MediaQuery.sizeOf(context).width * 0.455,
      height: MediaQuery.sizeOf(context).width * 0.455,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: kMainBlackColor),
            ),
            Image.asset(
              imgUrl,
              width: MediaQuery.sizeOf(context).width * 0.22,
              fit: BoxFit.cover,
            ),
            Text(
              desc,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: kCardDescColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
