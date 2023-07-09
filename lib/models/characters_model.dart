
class Character {
  final String? name;
  final String? description;
  final String? fullPortrait;
  final dynamic backgroundGradientColors;
  final dynamic abilities;

  Character({
    required this.name,
    required this.description,
    required this.fullPortrait,
    required this.backgroundGradientColors,
    required this.abilities,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
    name: json['displayName'], 
    description: json['description'], 
    fullPortrait: json['fullPortrait'], 
    backgroundGradientColors: json['backgroundGradientColors'],  
    abilities: json['abilities'],
  );

  @override
  String toString() {
    // implement toString
    return super.toString();
  }

}
