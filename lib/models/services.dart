class Services {
  const Services({
    required this.id,

    required this.title,
    required this.imageUrl,
    required this.details,
    required this.types,
    required this.bgimage,

  });

  final String id;

  final String title;
  final String imageUrl;
  final String bgimage;

  final List<String> details;
  final List<String> types;

}