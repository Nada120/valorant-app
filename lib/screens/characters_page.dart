import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/cubit/characters_cubit.dart';
import '../constant/colors.dart';
import '../widget/characters page/characters_page_body.dart';
import '../widget/global/custom_loading.dart';
import '../widget/global/show_error.dart';


class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          return CharactersPageBody(
            characters: state.characters,
          );
        } else if (state is CharactersFail) {
          return const ShowError();
        } else {
          return CustomLoading(
            size: 20,
            colors: [darkRed, teal, brightRed],
          );
        }
      },
    );
  }
}
