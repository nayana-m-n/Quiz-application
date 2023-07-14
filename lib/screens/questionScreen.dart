import '../controllers/controller.dart';
import '../screens/resultScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/question_anwer_list.dart';
import '../utils/quiz_filter_data.dart';
import '../widget/rectangleButton.dart';

Controller quizController = Get.put(Controller());

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.black,
        title: const Text(
          'Quiz Application',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Padding(
        padding: const EdgeInsets.only(
        // left: 35,
        right: 280,
          top: 7,
        ),
        child: Container(
          width: 68,
          height: 35.08,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(9, 8, 8, 1.0),
                  offset: Offset(
                    1,
                    5.0,
                  ),
                  blurRadius: 1.5,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(2, 1),
                  blurRadius: 0,
                  spreadRadius: 0,
                )
              ]
            //
          ),
          child: Center(
              child: Text(
                '${quizController.pageCount.value}/3',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              )),
        ),
      )

              ),
    SizedBox(
    height: MediaQuery.of(context).size.width * 0.08,
    ),              Obx(
                () => Text(
                  Questions.entries
                      .firstWhere((element) =>
                          element.key == quizController.pageCount.value)
                      .value,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.08,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Obx(
                    () => RectContainer(
                      mediaH: MediaQuery.of(context).size.height * 0.08,
                      mediaW: MediaQuery.of(context).size.width * 0.8,
                      option:
                          getOptionsData(quizController.pageCount.value, index),
                      isCorrect: getOptionsAnswerData(
                          quizController.pageCount.value, index),
                      indexVal: index,
                      onTap: () {
                        debugPrint("nbvbn...");
                        quizController.correctAns.add(getOptionsAnswerData(
                            quizController.pageCount.value, index));

                        quizController.prevoiusPageData.update(
                          quizController.pageCount.value,
                          (value) => index,
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.08,
              ),
              Center(
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (quizController.pageCount.value > 1)?
                      GestureDetector(
                        onTap: (){
                          quizController.pageCount.value =
                              quizController.pageCount.value - 1;
                        },
                          child: const Padding(
                            padding: EdgeInsets.only(
                              right: 20,
                              bottom: 5,
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.indigo,
                            ),
                          ),
                      ):SizedBox(width: 100,),
                      if (quizController.pageCount.value <= 3)
                        GestureDetector(
                          onTap: () async{
                            if(quizController.pageCount.value == 3){
                              int highScore = await quizController.getHighScore();
                              int currentHighScore = quizController.correctAns
                                  .where((element) => element == true)
                                  .length;
                              if (highScore < currentHighScore) {
                                quizController.setHighScore(currentHighScore);
                                highScore = await quizController.getHighScore();
                              }

                              Get.to(
                                    () => ResultScreen(
                                  highScore: highScore,
                                  currentScore: currentHighScore,
                                ),
                              );
                            }else {
                              quizController.pageCount.value =
                                  quizController.pageCount.value + 1;
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(
                              right: 20,
                              bottom: 5,
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            ),
                          ),
                        )

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


