import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/favorites_cubit.dart';
import '../../models/characters_model.dart';
import '../../screens/favorite_page.dart';
import '../global/custom_navigator.dart';
import '../../constant/colors.dart';

AppBar customAppBar(BuildContext context, List<Character> characters) {
  return AppBar(
    elevation: 0,
    iconTheme: const IconThemeData(
      size: 30,
      color: Colors.white,
    ),
    backgroundColor: darkGray,
    leading: IconButton(
      onPressed: () {
        context.read<FavoritesCubit>().listFavoriteCharacters(characters);
        pushPage(
          context,
          FavoritePage(
            characters: characters,
          ),
        );
      },
      icon: Icon(
        Icons.favorite,
        color: brightRed,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          // TODO here add search method
        },
        icon: const Icon(
          Icons.search_outlined,
        ),
      ),
    ],
  );
}
