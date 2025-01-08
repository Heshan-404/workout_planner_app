import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/models/equipment_model.dart';

class AddEquipmentCard extends StatefulWidget {
  final String equipmentName;
  final String equipmentDescription;
  final String equipmentImageUrl;
  final int noOfMinuites;
  final double noOfCalories;
  final Equipment equipment;
  bool isAddedEquipment;
  bool isFavEquipment;

  AddEquipmentCard({
    super.key,
    required this.equipmentName,
    required this.equipmentDescription,
    required this.equipmentImageUrl,
    required this.noOfMinuites,
    required this.noOfCalories,
    required this.isAddedEquipment,
    required this.isFavEquipment,
    required this.equipment,
  });

  @override
  State<AddEquipmentCard> createState() => _AddEquipmentCardState();
}

class _AddEquipmentCardState extends State<AddEquipmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: kMainBlackColor,
              blurRadius: 1,
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.equipmentName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: kMainBlackColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                widget.equipmentImageUrl,
                width: 64,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.noOfMinuites} mins of workout",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kCardDescColor,
                    ),
                  ),
                  Text(
                    "${widget.noOfCalories} Calories will burn",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kCardDescColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (widget.isAddedEquipment) {
                              user.removeEquipment(widget.equipment);
                            } else {
                              user.addEquipment(widget.equipment);
                            }
                            widget.isAddedEquipment = !widget.isAddedEquipment;
                          });
                        },
                        icon: Icon(
                          !widget.isAddedEquipment
                              ? Icons.add_circle
                              : Icons.remove_circle,
                          color: kGradientBottomColor,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 90,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (widget.isFavEquipment) {
                              user.removeFavEquipment(widget.equipment);
                            } else {
                              user.addFavEquipment(widget.equipment);
                            }
                            widget.isFavEquipment = !widget.isFavEquipment;
                          });
                        },
                        icon: Icon(
                          !widget.isFavEquipment
                              ? Icons.favorite_border
                              : Icons.favorite,
                          color: kMainPinkColor,
                          size: 30,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
