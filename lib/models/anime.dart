class Anime {
  final String title;
  final String imageUrl;
  final int popularity;
  final String duration;
  final String status;
  final String producer;
  final String trailerId;
  final int year;
  final int id;

  Anime(
      {required this.title,
      required this.imageUrl,
      required this.popularity,
      required this.duration,
      required this.status,
      required this.producer,
      required this.year,
      required this.id,
      required this.trailerId});

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      title: json['title'],
      imageUrl: json['images']['jpg']['small_image_url'],
      popularity: json['popularity'],
      duration: json['duration'],
      status: json['status'],
      producer: json.containsKey("producers") &&
              (json['producers'] as List).isNotEmpty
          ? (json['producers'] as List).firstOrNull["name"]
          : "",
      id: json['mal_id'],
      trailerId: json['trailer']['youtube_id'] ?? '',
      year: json['year'] ?? 0,
    );
  }
}
