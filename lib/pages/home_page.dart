import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/data/exercise_data.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/pages/equipments_page.dart';
import 'package:workout_planner/pages/sub_page.dart';
import 'package:workout_planner/widgets/reusable/card.dart';
import 'package:workout_planner/widgets/reusable/date_and_name_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    user.favExerciseList.forEach((ex) {
      print(ex.exerciseName);
    });
    return Scaffold(
      backgroundColor: kMainWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DateTimeSection(
                  title: "Hello, ${user.fullName}",
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [kGradientTopColor, kGradientBottomColor],
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Proteins, Fats &\nCarbohydrates",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: kMainWhiteColor,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "8 days",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: kMainWhiteColor,
                                  ),
                                ),
                                Text(
                                  "92 days left",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white38,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            LinearProgressIndicator(
                              value: 0.5,
                              minHeight: 8,
                              backgroundColor: kGradientBottomColor,
                              semanticsLabel: "ad",
                              color: kMainWhiteColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Today’s Activity",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: kMainBlackColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SubPage(
                                      title: "Warmup",
                                      desc:
                                          "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                                      dataList: ExerciseData().exerciseList),
                                ),
                              );
                            },
                            child: const ItemCard(
                                title: "Warmup",
                                imgUrl: "assets/images/exercises/cobra.png",
                                desc: "see more"),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EquipmentsPage(
                                      title: "Equipment",
                                      desc:
                                          "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler."),
                                ),
                              );
                            },
                            child: const ItemCard(
                                title: "Equipment",
                                imgUrl:
                                    "assets/images/equipments/dumbbells2.png",
                                desc: "see more"),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SubPage(
                                      title: "Exercise",
                                      desc:
                                          "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                                      dataList: ExerciseData().exerciseList),
                                ),
                              );
                            },
                            child: const ItemCard(
                                title: "Exercise",
                                imgUrl: "assets/images/exercises/dragging.png",
                                desc: "see more"),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SubPage(
                                      title: "Stretching",
                                      desc:
                                          "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                                      dataList: ExerciseData().exerciseList),
                                ),
                              );
                            },
                            child: const ItemCard(
                                title: "Stretching",
                                imgUrl: "assets/images/exercises/yoga.png",
                                desc: "see more"),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
