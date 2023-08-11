import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../models/characters_model.dart';
import '../service/character_favorite.dart';

class CharacterGirdView extends StatefulWidget {
  final List<Character> character;

  const CharacterGirdView({super.key, required this.character});

  @override
  State<CharacterGirdView> createState() => _CharacterGirdViewState();
}

class _CharacterGirdViewState extends State<CharacterGirdView> {
  late List<String> favorites;

  @override
  void initState() {
    super.initState();
    favorites = widget.character.map((e) => e.isFavorite.toString()).toList();
    addToFavoriteCharacters(
      isFavorite: favorites,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: widget.character.length,
        itemBuilder: buildUI,
      ),
    );
  }

  Widget buildUI(_, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: darkGray,
        gradient: LinearGradient(
          end: Alignment.topCenter,
          begin: Alignment.bottomCenter,
          colors: [
            darkGray,
            darkGray.withOpacity(0.3),
          ],
        ),
      ),
      height: 400,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          widget.character[index].fullPortrait != null
          ? Image.network(
            widget.character[index].fullPortrait!, 
            height: 400,
          )
          : Image.asset(
            'assets/images/error.png',
            height: 400,
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              onPressed: (){
                setState(() {
                  widget.character[index].isFavorite = !widget.character[index].isFavorite;
                  addToFavoriteCharacters(
                    isFavorite: favorites,
                  );
                });
              }, 
              icon: Icon(
                widget.character[index].isFavorite
                ? Icons.favorite
                : Icons.favorite_border,
                color: darkRed,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // TODO SHOW DATA HERE
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                gradient: LinearGradient(
                  colors: [
                    teal,
                    teal.withOpacity(0.6),
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  widget.character[index].name ?? 'none',
                  style: const TextStyle(
                    fontFamily: 'gamerBold',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
