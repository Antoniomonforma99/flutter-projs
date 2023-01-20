// ignore_for_file: public_member_api_docs, sort_constructors_first
class Recipe {
  late final String name;
  late final String images;
  late final double rating;
  late final String totalTime;

  Recipe(name, images, rating, totalTime) {
    this.name = name;
    this.images = images;
    this.rating = rating;
    this.totalTime = totalTime;
  }

/*
  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        name: json["name"] as String,
        images: json["images"][0]["hostedLargeUrl"] as String,
        rating: json["rating"] as double,
        totalTime: json["totalTime"] as String);
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data!);
    }).toList();
  }
  */
}
