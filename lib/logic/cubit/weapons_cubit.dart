import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../models/weapons_model.dart';
import '../../service/weapons_service.dart';
part 'weapons_state.dart';

class WeaponsCubit extends Cubit<WeaponsState> {
  WeaponsCubit() : super(WeaponsInitial());

  List<Weapon> weapons = [];
  final weaponsProvider = WeaponsServices();
  void getWeapons() async {
    try {
      emit(WeaponsLoading());
      weapons = await weaponsProvider.getAllWeapons();
      emit(WeaponsLoaded());
    } catch (error) {
      emit(WeaponsFaluire());
      throw "Error that $error";
    }
  }
}
