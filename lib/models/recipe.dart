class Recipe {
  final int id;
  final String title;
  final String author;
  final String time;
  final String image;
  final String rating;

  Recipe({
    required this.id,
    required this.title,
    required this.author,
    required this.time,
    required this.image,
    required this.rating,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      time: json['time'],
      image: json['image'] ?? '', // fallback if null
      rating: json['rating'] ?? '0.0',
    );
  }
}
