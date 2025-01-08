import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/models/exercise_model.dart';
import 'package:workout_planner/widgets/reusable/card.dart';

class SubPage extends StatefulWidget {
  final String title;
  final String desc;
  final List<Exercise> dataList;
  const SubPage({
    super.key,
    required this.title,
    required this.desc,
    required this.dataList,
  });

  @override
  State<SubPage> createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('EEEE , MMMM');
    final DateFormat dayFormat = DateFormat("dd");

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
              widget.title,
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
                  widget.desc,
                  style: TextStyle(fontSize: 15, color: kSubPageDescColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                GridView.builder(
                  itemCount: widget.dataList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(1),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) => ItemCard(
                    title: widget.dataList[index].exerciseName,
                    imgUrl: widget.dataList[index].exerciseImageUrl,
                    desc:
                        "${widget.dataList[index].noOfMinuites} mins of workout",
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
