class GameModel {
  final int id;
  final String title;
  final String thumbnail;
  final String shortDescription;
  final String gameUrl;
  final String genre;
  final String platform;
  final String publisher;
  final String developer;
  final String releaseDate;
  final String freeToGame;

  GameModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.shortDescription,
    required this.gameUrl,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.developer,
    required this.releaseDate,
    required this.freeToGame,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      id: json["id"] as int? ?? 0,
      title: json["title"] as String? ?? "",
      thumbnail: json["thumbnail"] as String? ??"",
      shortDescription: json["shortDescription"] as String? ??"",
      gameUrl: json["gameUrl"] as String? ?? "",
      genre: json["genre"] as String? ?? "",
      platform: json["platform"] as String? ?? "",
      publisher: json["publisher"] as String? ??"",
      developer: json["developer"] as String? ??"",
      releaseDate: json["releaseDate"] as String? ??"",
      freeToGame: json["freeToGame"] as String? ?? "",
    );
  }
}
