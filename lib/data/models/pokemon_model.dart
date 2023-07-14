class PokemonModel {
  final int id;
  final String num;
  final String name;
  final String img;
  final String height;
  final String weight;
  final String candy;
  final List<String> weaknesses;

  PokemonModel({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.height,
    required this.weight,
    required this.candy,
    required this.weaknesses,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json["id"] ?? 0,
      num: json["num"] ?? "",
      name: json["name"] ?? "",
      img: json["img"] ?? "",
      height: json["height"] ?? "",
      weight: json["weight"] ?? "",
      candy: json["candy"] ?? "",
      weaknesses: List<String>.from(json["weaknesses"] ?? []),
    );
  }
}

