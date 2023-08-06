import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../models/characters_model.dart';

class CharacterGirdView extends StatefulWidget {
  final List<Character> character;

  const CharacterGirdView({super.key, required this.character});

  @override
  State<CharacterGirdView> createState() => _CharacterGirdViewState();
}

class _CharacterGirdViewState extends State<CharacterGirdView> {
  List<bool> isFavorite = [];

  @override
  void initState() {
    super.initState();
    for (int i=0; i<widget.character.length; i++) {
      isFavorite.add(false);
    }
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
          Image.network(
            widget.character[index].fullPortrait ??
                "https://cdn.dribbble.com/users/1078347/screenshots/2799566/media/8a4ae0833c5e06c34e48b87c7583dc2d.png?compress=1&resize=400x300&vertical=center",
            height: 400,
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              onPressed: (){
                setState(() {
                  isFavorite[index] = !isFavorite[index];
                });
              }, 
              icon: Icon(
                isFavorite[index]
                ? Icons.favorite
                : Icons.favorite_border,
                color: Colors.amber,
              ),
            ),
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: darkRed,
              gradient: LinearGradient(
                colors: [
                  darkRed,
                  darkRed.withOpacity(0.6),
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
        ],
      ),
    );
  }
}
