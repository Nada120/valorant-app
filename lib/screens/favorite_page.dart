import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_app/constant/colors.dart';
import 'package:valorant_app/widget/custom_navigator.dart';

import '../provider/characters_provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  bool isSelectedIcon = true;

  @override
  Widget build(BuildContext context) {
    final characters = Provider.of<CharactersProvider>(context).characters;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkGray,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
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
          customIconButton(
            onPressed: () {
              setState(() {
                isSelectedIcon = !isSelectedIcon;
              });
            },
            icon: Icons.view_list,
            color: isSelectedIcon ? brightRed : gray,
          ),
          customIconButton(
            onPressed: () {
              setState(() {
                isSelectedIcon = !isSelectedIcon;
              });
            },
            icon: Icons.grid_view,
            color: !isSelectedIcon ? brightRed : gray,
          ),
        ],
      ),
      body: Container(
        color: darkGray,
        width: double.infinity,
        child: ListView.builder(
          itemCount: characters.length,
          itemBuilder: (_, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              height: 180,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: width * 0.27,
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                            characters[index].name!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          width: width * 0.65,
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            characters[index].description!,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: width * 0.25,
                      height: 180,
                      decoration: BoxDecoration(
                        color: brightRed,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: Image.network(
                        characters[index].fullPortrait!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget customIconButton({
  required void Function() onPressed,
  required IconData icon,
  required Color color,
}) {
  return IconButton(
    onPressed: onPressed,
    icon: Icon(
      icon,
      color: color,
      size: 25,
    ),
  );
}
