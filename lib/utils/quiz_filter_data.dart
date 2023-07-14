

import '../services/question_anwer_list.dart';

getOptionsData(int val, int index) {
  switch (val) {
    case 2:
      return OptionsForQ2.entries
          .firstWhere((element) => element.key == index)
          .value;
    case 3:
      return OptionsForQ3.entries
          .firstWhere((element) => element.key == index)
          .value;
    default:
      return OptionsForQ1.entries
          .firstWhere((element) => element.key == index)
          .value;
  }
}

getOptionsAnswerData(int val, int index) {
  switch (val) {
    case 2:
      return OptionsForQ2Answer.entries
          .firstWhere((element) => element.key == index)
          .value;
    case 3:
      return OptionsForQ3Answer.entries
          .firstWhere((element) => element.key == index)
          .value;
    default:
      return OptionsForQ1Answer.entries
          .firstWhere((element) => element.key == index)
          .value;
  }
}
