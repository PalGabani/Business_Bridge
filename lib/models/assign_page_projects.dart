// class AssignedProjects {
//   const AssignedProjects({
//     required this.id,
//
//     required this.title,
//     required this.country,
//     required this.mobile,
// required this.email,
//
//   });
//
//   final String id;
//
//   final String title;
//   final String country;
//
//   final String mobile;
//   final String email;
//
//
// }
class AssignedProject {
  final String id;
  final String title;
  final String country;
  final String mobile;
  final String email;
  final int current_index;
  final MainDetails maindetails;
  final List<Map<String, String>> details12;

  AssignedProject({
    required this.id,
    required this.title,
    required this.country,
    required this.mobile,
    required this.email,
    required this.current_index,
    required this.maindetails,
    required this.details12,
  });
}

class MainDetails {
  final String companyname;
  final String description;
  final String duedate;

  MainDetails({
    required this.companyname,
    required this.description,
    required this.duedate,
  });
}

// class ProjectDetail {
//   final String task1;
//   final String task1detail;
//   final String task2;
//   final String task2detail;
//   final String task3;
//   final String task3detail;
//
//   ProjectDetail({
//     required this.task1,
//     required this.task1detail,
//     required this.task2,
//     required this.task2detail,
//     required this.task3,
//     required this.task3detail,
//   });
// }
