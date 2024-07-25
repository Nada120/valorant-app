part of 'weapons_cubit.dart';

@immutable
sealed class WeaponsState {}

final class WeaponsInitial extends WeaponsState {}

final class WeaponsLoading extends WeaponsState {}

final class WeaponsLoaded extends WeaponsState {}

final class WeaponsFaluire extends WeaponsState {}