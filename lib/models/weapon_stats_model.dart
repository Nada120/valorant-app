class WeaponStats {
  final num fireRate;
  final num magazineSize;
  final num equipTimeSeconds;
  final num reloadTimeSeconds;
  final num firstBulletAccuracy;
  final num shotgunPelletCount;

  WeaponStats({
    required this.fireRate,
    required this.magazineSize,
    required this.equipTimeSeconds,
    required this.reloadTimeSeconds,
    required this.firstBulletAccuracy,
    required this.shotgunPelletCount,
  });

  factory WeaponStats.fromJSON(Map<String, dynamic>? json) => WeaponStats(
        fireRate: json != null ? json['fireRate'] ?? 0 : 0,
        magazineSize: json != null ? json['magazineSize'] ?? 0 : 0,
        equipTimeSeconds: json != null ? json['equipTimeSeconds'] ?? 0 : 0,
        reloadTimeSeconds: json != null ? json['reloadTimeSeconds'] ?? 0 : 0,
        firstBulletAccuracy:
            json != null ? json['firstBulletAccuracy'] ?? 0 : 0,
        shotgunPelletCount: json != null ? json['shotgunPelletCount'] ?? 0 : 0,
      );
}
