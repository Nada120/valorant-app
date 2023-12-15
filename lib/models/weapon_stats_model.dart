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

  factory WeaponStats.fromJSON(Map<String, dynamic> json) => WeaponStats(
    fireRate: json['fireRate'], 
    magazineSize: json['magazineSize'], 
    equipTimeSeconds: json['equipTimeSeconds'], 
    reloadTimeSeconds: json['reloadTimeSeconds'], 
    firstBulletAccuracy: json['firstBulletAccuracy'], 
    shotgunPelletCount: json['shotgunPelletCount'],
  );
}
