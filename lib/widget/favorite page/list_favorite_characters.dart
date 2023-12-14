import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import '../../models/characters_model.dart';

class ListFavoriteCharacters extends StatelessWidget {
  final List<Character> favoriteCharacters;
  const ListFavoriteCharacters({super.key, required this.favoriteCharacters});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: darkGray,
      width: double.infinity,
      child: ListView.builder(
        itemCount: favoriteCharacters.length,
        itemBuilder: (_, index) {
          return Container(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              bottom: 10,
            ),
            height: width * 0.65,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        decoration: BoxDecoration(
                          color: teal,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(20),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(1, 2),
                              blurRadius: 3.0,
                            ),
                          ],
                        ),
                        child: Text(
                          favoriteCharacters[index].name!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const Spacer(flex: 2),
                      Container(
                        width: 220,
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          favoriteCharacters[index].description!,
                        ),
                      ),
                      const Spacer(flex: 1),
                    ],
                  ),
                  Container(
                    width: width * 0.25,
                    height: width * 0.7,
                    decoration: BoxDecoration(
                      color: brightRed,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                    child: Image.network(
                      favoriteCharacters[index].fullPortrait!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
