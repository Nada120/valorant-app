import 'package:flutter_bloc/flutter_bloc.dart';

class AbilitySelectionCubit extends Cubit<int> {
  AbilitySelectionCubit() : super(0);

  changeAbility(int ability) => emit(ability);
}
