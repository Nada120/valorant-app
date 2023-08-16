
class Character {
  final String? name;
  final String? description;
  final String? fullPortrait;
  final List<dynamic> abilities;
  bool isFavorite; 

  Character({
    required this.name,
    required this.description,
    required this.fullPortrait,
    required this.abilities,
    this.isFavorite = false
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
    name: json['displayName'], 
    description: json['description'], 
    fullPortrait: json['fullPortrait'], 
    abilities: json['abilities'],
  );

  @override
  String toString() {
    // implement toString
    return super.toString();
  }

}
