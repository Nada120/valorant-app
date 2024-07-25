import 'weapon_stats_model.dart';

class Weapon {
  final String name;
  final String category;
  final String urlImage;
  final num cost;
  final WeaponStats weaponStats;

  Weapon({
    required this.name,
    required this.category,
    required this.urlImage,
    required this.cost,
    required this.weaponStats,
  });

  factory Weapon.fromJSON(Map<String, dynamic> json) => Weapon(
        name: json['displayName'],
        category: json['category'],
        urlImage: json['displayIcon'],
        cost: json['shopData'] != null ? json['shopData']['cost'] ?? 0 : 0,
        weaponStats: WeaponStats.fromJSON(json['weaponStats']),
      );
}
