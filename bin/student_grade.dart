import 'dart:io';

// 학생 클래스에 이름과 점수 매개변수로 받을 수 있음
class Student {
  String name;
  int score;
// 학생 멤버 변수를 초기화 하는데 사용됨
  Student(this.name, this.score);
}

class ScoreManager {
  // 학생 객체를 저장하기 위한 빈 리스트 작성
  List<Student> students = [];

//학생 추가
  void addStudent() {
    // 줄바꿈 없음 print와 비교
    stdout.write('학생 이름을 입력하세요: ');
    // null 입력가능하기에 ? 추가
    // stdin.readLineSync()
    String? name = stdin.readLineSync();

    stdout.write('학생 점수를 입력하세요: ');
    //입력 타입 String을 int.tryParse로 int로 변환
    // ?? '' null값일때 ''로 변환하여 안정적으로 처리가능
    int? score = int.tryParse(stdin.readLineSync() ?? '');

// null 반환 가능성으로 && 연산자로 두경우 다 null 이 아닌경우 추가
    if (name != null && score != null) {
      students.add(Student(name, score));
      print('$name 학생이 추가되었습니다.');
    } else {
      print('유효하지 않은 입력입니다. 다시 시도하세요');
    }
  }

// 학생 목록 출력
  void studentList() {
    if (students.isEmpty) {
      print('학생목록이 비어 있습니다.');
    } else {
      print('학생목록:');
      // 인덱스 범위를 초과하지 않는 조건에서 ++연산자 실행
      for (int i = 0; i < students.length; i++) {
        // i는 0이라서 1.name-00점
        print('${i + 1}. ${students[i].name} - ${students[i].score}점');
      }
    }
  }

// 평균 점수 계산
  void scoreAver() {
    if (students.isEmpty) {
      print('학생 데이터가 없습니다.');
    } else {
      double average =
          // 학생 score 값을 ab로 변환하여 익명 함수로, 리스트의 모든 점수를 합산합니다
          students.map((student) => student.score).reduce((a, b) => a + b) /
              students.length;
      print('평균 점수: ${average.toStringAsFixed(1)}');
      //double 값을 문자열로 변환하며, 소수점 아래 1자리까지만 표시합니다
    }
  }
}

void main() {
  ScoreManager scoreManager = ScoreManager();
  //객체 생성
  bool isTerminated = false;

  while (!isTerminated) {
    print('\n학생 성적 관리 프로그램');
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
      // isTermated true 값으로 종료
      default:
        print('지원하지 않는 기능입니다! 다시 시도해 주세요');
      // 주석
      // 깃허브 테스트
    }
  }
}
