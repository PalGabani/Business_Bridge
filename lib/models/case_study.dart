class case_Study {
  const case_Study({
    required this.id,

    required this.title,
    required this.imageUrl,
    required this.ClientGoal,
    required this.Situation,
    required this.Study,

  });

  final String id;

  final String title;
  final String imageUrl;
  final List<String> ClientGoal;
  final List<String> Situation;
  final List<String> Study;

}