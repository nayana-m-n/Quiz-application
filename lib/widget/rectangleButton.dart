import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../screens/questionScreen.dart';

class RectContainer extends StatelessWidget {
  final Function() onTap;
  final int indexVal;
  final String option;
  final bool isCorrect;
  final double mediaH;
  final double mediaW;
  const RectContainer(
      {required this.onTap,
        required this.indexVal,
        required this.option,
        required this.isCorrect,
        required this.mediaH,
        required this.mediaW,
        super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => GestureDetector(
        onTap: () => quizController.prevoiusPageData.entries
            .firstWhere((element) =>
        element.key == quizController.pageCount.value)
            .value ==
            -1
            ? onTap()
            : null,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          width: mediaW,
          height: mediaH,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            color: (quizController.prevoiusPageData.entries
                .firstWhere((element) =>
            element.key == quizController.pageCount.value)
                .value !=
                -1 &&
                quizController.prevoiusPageData.entries
                    .firstWhere((element) =>
                element.key == quizController.pageCount.value)
                    .value ==
                    indexVal)
                ? Colors.black26
                : Colors.blue,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                option,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),

            ],
          ),
        ),
      ),
    );
  }
}