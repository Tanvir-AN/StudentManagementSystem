// A. Define an interface named Role:
abstract class Role {
  void displayRole();
}

// B. Create a class Person:
class Person implements Role {
  String name;
  int age;
  String address;
  Role role;

  Person({required this.name, required this.age, required this.address, required this.role});

  @override
  void displayRole() {
    role.displayRole();
  }

  String getName() => name;
  int getAge() => age;
  String getAddress() => address;
}

// C. Create a class Student that extends Person:
class Student extends Person {
  String studentID;
  double grade = 0.0;
  List<double> courseScores = [];

  Student({
    required String name,
    required int age,
    required String address,
    required this.studentID,
  }) : super(name: name, age: age, address: address, role: StudentRole());

  @override
  void displayRole() {
    print("Role: Student");
  }

  void calculateAverageScore() {
    if (courseScores.isNotEmpty) {
      grade =
          courseScores.reduce((value, element) => value + element) /
              courseScores.length;
    }
  }
}

// D. Create another class Teacher that extends Person:
class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught = [];

  Teacher({
    required String name,
    required int age,
    required String address,
    required this.teacherID,
  }) : super(name: name, age: age, address: address, role: TeacherRole());

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void displayCoursesTaught() {
    print("Courses Taught:");
    for (String course in coursesTaught) {
      print("- $course");
    }
  }
}

// E. Create a class StudentManagementSystem:
class StudentManagementSystem {
  static void main() {
    // Create instances of Student and Teacher classes
    Student student = Student(name: "MD. Tanvir Ahmed", age: 25, address: "H-179/5, Mirpur-2", studentID: "+8801922502030");
    student.courseScores = [90, 90, 100];
    student.calculateAverageScore();

    Teacher teacher = Teacher(name: "Rafat Meraz", age: 35, address: "Uttora, Dhaka, Bangladesh", teacherID: "+880 1309-063702");
    teacher.coursesTaught = ["Math", "English", "Bangla"];

    // Display information
    print("Student Information:");
    student.displayRole();
    print("Name: ${student.getName()}");
    print("Age: ${student.getAge()}");
    print("Address: ${student.getAddress()}");
    print("Average Score: ${student.grade.toStringAsFixed(2)}\n");

    print("Teacher Information:");
    teacher.displayRole();
    print("Name: ${teacher.getName()}");
    print("Age: ${teacher.getAge()}");
    print("Address: ${teacher.getAddress()}");
    teacher.displayCoursesTaught();
  }
}

// Implement Role interface for Student
class StudentRole implements Role {
  @override
  void displayRole() {
    print("Role: Student");
  }
}

// Implement Role interface for Teacher
class TeacherRole implements Role {
  @override
  void displayRole() {
    print("Role: Teacher");
  }
}

void main() {
  // Call the main method of StudentManagementSystem
  StudentManagementSystem.main();
}