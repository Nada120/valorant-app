import 'package:flutter_bloc/flutter_bloc.dart';

class TabControllerCubit extends Cubit<int> {
  TabControllerCubit() : super(0);

  void changePage(int page) => emit(page);
}
