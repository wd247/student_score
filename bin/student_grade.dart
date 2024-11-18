import 'dart:io';

class Student {
  String name;
  int score;

  Student(this.name, this.score);
}

class ScoreManager {
  List<Student> students = [];

  void addStudent() {
    stdout.write('학생 이름을 입력하세요: ');
    String? name = stdin.readLineSync();

    stdout.write('학생 점수를 입력하세요: ');
    int? score = int.tryParse(stdin.readLineSync() ?? '');

    if (name != null && score != null) {
      students.add(Student(name, score));
      print('$name 학생이 추가되었습니다.');
    } else {
      print('유효하지 않은 입력입니다. 다시 시도하세요');
    }
  }

  void studentList() {
    if (students.isEmpty) {
      print('학생목록이 비어 있습니다.');
    } else {
      print('학생목록:');
      for (int i = 0; i < students.length; i++) {
        print('${i + 1}. ${students[i].name} - ${students[i].score}점');
      }
    }
  }

  void scoreAver() {
    if (students.isEmpty) {
      print('학생 데이터가 없습니다.');
    } else {
      double average =
          students.map((student) => student.score).reduce((a, b) => a + b) /
              students.length;
      print('평균 점수: ${average.toStringAsFixed(1)}');
    }
  }
}

void main() {
  // List<Student> students = [];
  ScoreManager scoreManager = ScoreManager();
  bool isTerminated = false;

  while (!isTerminated) {
    print('/n학생 성적 관리 프로그램');
    print('1. 학생 추가');
    print('2. 학생 목록 출력');
    print('3. 평균 점수 계산');
    print('4. 종료');
    stdout.write('메뉴를 선택하세요:');

    String? input = stdin.readLineSync();
    switch (input) {
      case '1':
        scoreManager.addStudent();
      case '2':
        scoreManager.studentList();
      case '3':
        scoreManager.scoreAver();
      case '4':
        print('프로그램을 종료합니다.');
        isTerminated = true;
      default:
        print('지원하지 않는 기능입니다! 다시 시도해 주세요.');
    }
  }
}
