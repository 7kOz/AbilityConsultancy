import 'dart:async';
import 'package:quiver/async.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class QuizController extends GetxController {
  int timerCount = 60;
  int currentTimer = 60;

  @override
  void onInit() {
    super.onInit();
    startTimerInit();
  }

  List<bool> answers = [];

  String questionCount = '1';
  String question = 'What is the sign for listen?';
  bool question1 = true;
  bool question2 = false;
  bool question3 = false;
  bool question4 = false;
  bool question5 = false;
  bool question6 = false;
  bool question7 = false;
  bool result = false;

  onAnswerOne(bool b) {
    answers.add(b);
    questionCount = '2';
    question = 'What does this sign mean?';
    question1 = false;
    question2 = true;
    question3 = false;
    question4 = false;
    question5 = false;
    question6 = false;
    question7 = false;
    update();
  }

  onAnswerTwo(bool b) {
    answers.add(b);
    questionCount = '3';
    question = 'What is the sign for letter C?';
    question1 = false;
    question2 = false;
    question3 = true;
    question4 = false;
    question5 = false;
    question6 = false;
    question7 = false;
    update();
  }

  onAnswerThree(bool b) {
    answers.add(b);
    questionCount = '4';
    question = 'What is the sign for please?';
    question1 = false;
    question2 = false;
    question3 = false;
    question4 = true;
    question5 = false;
    question6 = false;
    question7 = false;
    update();
  }

  onAnswerFour(bool b) {
    answers.add(b);
    questionCount = '5';
    question = 'What is the sign for\nthe word stop?';
    question1 = false;
    question2 = false;
    question3 = false;
    question4 = false;
    question5 = true;
    question6 = false;
    question7 = false;
    update();
  }

  onAnswerFive(bool b) {
    answers.add(b);
    questionCount = '6';
    question = 'What does this sign mean?';
    question1 = false;
    question2 = false;
    question3 = false;
    question4 = false;
    question5 = false;
    question6 = true;
    question7 = false;
    update();
  }

  onAnswerSix(bool b) {
    answers.add(b);
    questionCount = '7';
    question = 'What is the sign for help?';
    question1 = false;
    question2 = false;
    question3 = false;
    question4 = false;
    question5 = false;
    question6 = false;
    question7 = true;
    update();
  }

  onResult(bool b) {
    answers.add(b);
    question1 = false;
    question2 = false;
    question3 = false;
    question4 = false;
    question5 = false;
    question6 = false;
    question7 = false;
    result = true;
    update();
    Future.delayed(const Duration(seconds: 100), () {
      Get.back();
    });
  }

  onReset() {
    answers.clear();
    questionCount = '1';
    question = 'What is the sign for listen?';
    question1 = true;
    question2 = false;
    question3 = false;
    question4 = false;
    question5 = false;
    question6 = false;
    question7 = false;
    result = false;
    update();
  }

  startTimerInit() {
    CountdownTimer countdownTimer = CountdownTimer(
      Duration(seconds: timerCount),
      const Duration(seconds: 1),
    );

    var sub = countdownTimer.listen(null);
    sub.onData((duration) {
      currentTimer = timerCount - duration.elapsed.inSeconds;
      update();
    });

    sub.onDone(() {
      answers.add(false);
      question1 = false;
      question2 = true;
      question3 = false;
      question4 = false;
      question5 = false;
      question6 = false;
      question7 = false;
      update();
      startTimerSecond();
    });
  }

  startTimerSecond() {
    CountdownTimer countdownTimer = CountdownTimer(
      Duration(seconds: timerCount),
      const Duration(seconds: 1),
    );

    var sub = countdownTimer.listen(null);
    sub.onData((duration) {
      currentTimer = timerCount - duration.elapsed.inSeconds;
      update();
    });

    sub.onDone(() {
      answers.add(false);
      question1 = false;
      question2 = false;
      question3 = true;
      question4 = false;
      question5 = false;
      question6 = false;
      question7 = false;
      update();
      startTimerThird();
    });
  }

  startTimerThird() {
    CountdownTimer countdownTimer = CountdownTimer(
      Duration(seconds: timerCount),
      const Duration(seconds: 1),
    );

    var sub = countdownTimer.listen(null);
    sub.onData((duration) {
      currentTimer = timerCount - duration.elapsed.inSeconds;
      update();
    });

    sub.onDone(() {
      answers.add(false);
      question1 = false;
      question2 = false;
      question3 = false;
      question4 = true;
      question5 = false;
      question6 = false;
      question7 = false;
      update();
      startTimerFourth();
    });
  }

  startTimerFourth() {
    CountdownTimer countdownTimer = CountdownTimer(
      Duration(seconds: timerCount),
      const Duration(seconds: 1),
    );

    var sub = countdownTimer.listen(null);
    sub.onData((duration) {
      currentTimer = timerCount - duration.elapsed.inSeconds;
      update();
    });

    sub.onDone(() {
      answers.add(false);
      question1 = false;
      question2 = false;
      question3 = false;
      question4 = false;
      question5 = true;
      question6 = false;
      question7 = false;
      update();
      startTimerFifth();
    });
  }

  startTimerFifth() {
    CountdownTimer countdownTimer = CountdownTimer(
      Duration(seconds: timerCount),
      const Duration(seconds: 1),
    );

    var sub = countdownTimer.listen(null);
    sub.onData((duration) {
      currentTimer = timerCount - duration.elapsed.inSeconds;
      update();
    });

    sub.onDone(() {
      answers.add(false);
      question1 = false;
      question2 = false;
      question3 = false;
      question4 = false;
      question5 = false;
      question6 = true;
      question7 = false;
      update();
      startTimerSixth();
    });
  }

  startTimerSixth() {
    CountdownTimer countdownTimer = CountdownTimer(
      Duration(seconds: timerCount),
      const Duration(seconds: 1),
    );

    var sub = countdownTimer.listen(null);
    sub.onData((duration) {
      currentTimer = timerCount - duration.elapsed.inSeconds;
      update();
    });

    sub.onDone(() {
      answers.add(false);
      question1 = false;
      question2 = false;
      question3 = false;
      question4 = false;
      question5 = false;
      question6 = false;
      question7 = true;
      update();
      startTimerLast();
    });
  }

  startTimerLast() {
    CountdownTimer countdownTimer = CountdownTimer(
      Duration(seconds: timerCount),
      const Duration(seconds: 1),
    );

    var sub = countdownTimer.listen(null);
    sub.onData((duration) {
      currentTimer = timerCount - duration.elapsed.inSeconds;
      update();
    });

    sub.onDone(() {
      answers.add(false);
      question1 = false;
      question2 = false;
      question3 = false;
      question4 = false;
      question5 = false;
      question6 = false;
      question7 = false;
      result = true;
      update();
      Future.delayed(const Duration(seconds: 100), () {
        Get.back();
      });
    });
  }
}
