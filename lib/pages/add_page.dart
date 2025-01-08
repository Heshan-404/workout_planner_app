import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/data/equipment_data.dart';
import 'package:workout_planner/data/exercise_data.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/models/equipment_model.dart';
import 'package:workout_planner/models/exercise_model.dart';
import 'package:workout_planner/widgets/reusable/add_equipment_card.dart';
import 'package:workout_planner/widgets/reusable/add_exercise_card.dart';

class AddPage extends StatefulWidget {
  final List<Exercise> exerciseList = ExerciseData().exerciseList;
  final List<Equipment> equipmentList = EquipmentData().equipmentList;

  AddPage({super.key});

  @override
  State<AddPage> createState() => _AppPageState();
}

class _AppPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kMainWhiteColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello ${user.fullName}",
                    style: const TextStyle(
                      color: kMainBlackColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Lets Add Some Workouts and Equipment for today!",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kCardDescColor,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "All Exercises",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kMainBlackColor,
                    ),
                  ),
                  SizedBox(
                    height: 169,
                    child: ListView.builder(
                      itemCount: widget.exerciseList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Exercise exercise = widget.exerciseList[index];
                        return AddExerciseCard(
                          exercise: exercise,
                          isExerciseAlreadyAdded:
                              user.isAddedExercise(exercise),
                          isExerciseFav: user.isFavExercise(exercise),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Equipment",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kMainBlackColor,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2.8,
                    child: SingleChildScrollView(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(2),
                        itemCount: widget.equipmentList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 3 / 1.5,
                          mainAxisSpacing: 15,
                        ),
                        itemBuilder: (context, index) {
                          Equipment equipment = widget.equipmentList[index];
                          return AddEquipmentCard(
                            equipment: equipment,
                            equipmentName: equipment.equipmentName,
                            equipmentDescription:
                                equipment.equipmentDescription,
                            equipmentImageUrl: equipment.equipmentImageUrl,
                            noOfMinuites: equipment.noOfMinuites,
                            noOfCalories: equipment.noOfCalories,
                            isAddedEquipment: user.isAddedEquipment(equipment),
                            isFavEquipment: user.isFavEquipment(equipment),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 280,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [kGradientBottomColor, kMainPinkColor],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Proceed",
                            style: TextStyle(
                              fontSize: 15,
                              color: kMainWhiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
