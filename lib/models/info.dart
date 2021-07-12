abstract class Info {
  final String name;
  final String imageUrl;
  final String? description;
  Info({
    required this.name,
    required this.imageUrl,
    this.description,
  });
}
