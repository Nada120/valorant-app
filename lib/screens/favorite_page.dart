import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/cubit/view_favorites_cubit.dart';
import '../models/characters_model.dart';
import '../logic/cubit/favorites_cubit.dart';
import '../widget/favorite page/grid_favorite_characters.dart';
import '../widget/favorite%20page/list_favorite_characters.dart';
import '../widget/global/custom_loading.dart';
import '../constant/colors.dart';
import '../widget/global/custom_icon_button.dart';
import '../widget/global/custom_navigator.dart';

class FavoritePage extends StatelessWidget {
  final List<Character> characters;
  const FavoritePage({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewFavoritesCubit, int>(
      builder: (context, view) {
        return Scaffold(
          backgroundColor: darkGray,
          appBar: AppBar(
            backgroundColor: darkGray,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                context.read<FavoritesCubit>().showFavorites();
                popPage(context);
              },
              icon: const Icon(
                Icons.arrow_circle_left_rounded,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            title: const Text(
              'FAVORITE',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            actions: [
              CustomIconButton(
                onPressed: () {
                  context.read<ViewFavoritesCubit>().changeView(0);
                },
                icon: Icons.view_list,
                color: view == 0 ? brightRed : gray,
              ),
              CustomIconButton(
                onPressed: () {
                  context.read<ViewFavoritesCubit>().changeView(1);
                },
                icon: Icons.grid_view,
                color: view == 1 ? brightRed : gray,
              ),
            ],
          ),
          body: BlocBuilder<FavoritesCubit, FavoritesState>(
            builder: (context, state) {
              if (state is CharacterFavoriteLoaded) {
                return view == 0? ListFavoriteCharacters(
                  favoriteCharacters: state.favoritesCharacters,
                ): GridFavoriteCharacters(
                  characters: state.favoritesCharacters
                );
              } else if (state is NoCharacterFavorite) {
                return Center(
                  child: Text(
                    'It Is Empty',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: gray,
                    ),
                  ),
                );
              } else {
                return CustomLoading(
                  size: 20,
                  colors: [darkRed, teal, brightRed],
                );
              }
            },
          ),
        );
      },
    );
  }
}
