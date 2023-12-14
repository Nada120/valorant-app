import 'package:flutter_bloc/flutter_bloc.dart';

class ViewFavoritesCubit extends Cubit<int> {
  ViewFavoritesCubit() : super(0);

  void changeView(int view) => emit(view);
}
