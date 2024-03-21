class Course {
  String code;
  String teacher;
  ArrayList<Student> students;

  Course(String c, String t) {
    this.code = c;
    this.teacher = t;
  }

  void addStudent(Student s) {
    this.students.add(s);
  }

  void describe() {
    println(students.toString());
  }

}