class ItemCardData {
  const ItemCardData({
    required this.imageName,
    required this.title,
    required this.description,
    required this.tags,
    required this.metadata1,
    required this.metadata2,
  });

  final String imageName;
  final String title;
  final String description;
  final List<String> tags;
  final String metadata1;
  final String metadata2;
}
