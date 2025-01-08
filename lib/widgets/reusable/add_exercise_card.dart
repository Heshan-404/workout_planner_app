// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/models/exercise_model.dart';

class AddExerciseCard extends StatefulWidget {
  final Exercise exercise;
  bool isExerciseAlreadyAdded;
  bool isExerciseFav;

  AddExerciseCard({
    super.key,
    required this.exercise,
    required this.isExerciseAlreadyAdded,
    required this.isExerciseFav,
  });

  @override
  State<AddExerciseCard> createState() => _AddExerciseCardState();
}

class _AddExerciseCardState extends State<AddExerciseCard> {
  final List<Exercise> exerciseList = user.exerciseList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 10,
        top: 3,
        bottom: 3,
        left: 3,
      ),
      width: 160,
      decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: kMainBlackColor,
              blurRadius: 2,
              offset: Offset(0, 1),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              widget.exercise.exerciseName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: kMainBlackColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              widget.exercise.exerciseImageUrl,
              width: 60,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.isExerciseAlreadyAdded =
                          !widget.isExerciseAlreadyAdded;
                    });
                    if (widget.isExerciseAlreadyAdded) {
                      setState(() {
                        user.removeExercise(widget.exercise);
                      });
                    } else {
                      setState(() {
                        user.addExercise(widget.exercise);
                      });
                    }
                  },
                  icon: Icon(
                    !widget.isExerciseAlreadyAdded
                        ? Icons.add_circle
                        : Icons.remove_circle,
                    color: kGradientBottomColor,
                    size: 25,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.isExerciseFav = !widget.isExerciseFav;
                    });
                    if (widget.isExerciseFav) {
                      setState(() {
                        user.removeFavExercise(widget.exercise);
                      });
                    } else {
                      setState(() {
                        user.addFavExercise(widget.exercise);
                      });
                    }
                  },
                  icon: Icon(
                    !widget.isExerciseFav
                        ? Icons.favorite_border
                        : Icons.favorite_sharp,
                    color: kMainPinkColor,
                    size: 25,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
