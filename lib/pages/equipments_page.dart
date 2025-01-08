import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/data/equipment_data.dart';
import 'package:workout_planner/models/equipment_model.dart';
import 'package:workout_planner/models/user_model.dart';
import 'package:workout_planner/widgets/reusable/equipment_card.dart';

class EquipmentsPage extends StatelessWidget {
  final String title;
  final String desc;

  final DateFormat dateFormat = DateFormat('EEEE , MMMM');
  final DateFormat dayFormat = DateFormat("dd");

  final eqipmentList = EquipmentData().equipmentList;
  final user = User;

  EquipmentsPage({super.key, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = dateFormat.format(now);
    String formattedDay = dayFormat.format(now);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Column(
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
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  desc,
                  style: TextStyle(fontSize: 15, color: kSubPageDescColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: GridView.builder(
                      itemCount: eqipmentList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 10,
                              childAspectRatio: 3 / 2),
                      itemBuilder: (context, index) {
                        Equipment equipment = eqipmentList[index];
                        return EquipmentCard(
                          equipmentName: equipment.equipmentName,
                          equipmentDescription: equipment.equipmentDescription,
                          equipmentImageUrl: equipment.equipmentImageUrl,
                          noOfMinuites: equipment.noOfMinuites,
                          noOfCalories: equipment.noOfCalories,
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
