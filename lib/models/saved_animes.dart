class SavedAnime {
  final int id;
  final String title;

  SavedAnime({required this.id, required this.title});

  SavedAnime.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };
}
