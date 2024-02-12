class Anime {
  final String title;
  final String imageUrl;
  final int popularity;
  final String duration;

  Anime({
    required this.title,
    required this.imageUrl,
    required this.popularity,
    required this.duration,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      title: json['title'],
      imageUrl: json['images']['jpg']['small_image_url'],
      popularity: json['popularity'],
      duration: json['duration'],
    );
  }
}
