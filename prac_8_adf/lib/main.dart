import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Student {
  final String name;
  final String course;
  final String grade;

  Student({required this.name, required this.course, required this.grade});
}

class MyApp extends StatelessWidget {
  final List<Student> students = [
    Student(name: 'Alice Johnson', course: 'Mathematics', grade: 'A'),
    Student(name: 'Bob Smith', course: 'Computer Science', grade: 'B+'),
    Student(name: 'Charlie Davis', course: 'Physics', grade: 'A-'),
    Student(name: 'Diana Prince', course: 'Chemistry', grade: 'B'),
    Student(name: 'Ethan Hunt', course: 'Biology', grade: 'A'),
    Student(name: 'Fiona Gallagher', course: 'History', grade: 'B+'),
    Student(name: 'George White', course: 'Economics', grade: 'A-'),
    Student(name: 'Hannah Green', course: 'English Literature', grade: 'A'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student List View',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[200],
        cardTheme: CardTheme(
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      home: StudentListScreen(students: students),
    );
  }
}

class StudentListScreen extends StatelessWidget {
  final List<Student> students;

  StudentListScreen({required this.students});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Performance'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Text(
                  student.name[0],
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Text(student.name,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Course: ${student.course}'),
              trailing: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: _getGradeColor(student.grade),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  student.grade,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Color _getGradeColor(String grade) {
    switch (grade) {
      case 'A':
      case 'A-':
        return Colors.green;
      case 'B+':
      case 'B':
        return Colors.orange;
      default:
        return Colors.red;
    }
  }
}
