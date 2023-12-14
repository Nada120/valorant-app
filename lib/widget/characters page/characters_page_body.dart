import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../characters%20page/characters_gird_body.dart';
import '../../logic/cubit/tab_controller_cubit.dart';
import '../../constant/colors.dart';
import '../../models/characters_model.dart';
import 'custom_app_bar.dart';
import 'sticker_image.dart';

class CharactersPageBody extends StatelessWidget {
  final List<Character> characters;

  const CharactersPageBody({
    super.key, 
    required this.characters,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabControllerCubit, int>(
      builder: (context, pageIndex) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: customAppBar(context, characters),
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  StickerImage(
                    image: 'assets/images/ch1.png',
                    backColor: darkGray,
                    fontColor: Colors.white,
                    recColor: brightRed,
                    recColor2: teal,
                  ),
                  SizedBox(
                    height: 100,
                    width: double.maxFinite,
                    child: ColoredBox(
                      color: darkGray,
                      child: TabBar(
                        onTap: (page) {
                          context.read<TabControllerCubit>().changePage(page);
                        },
                        indicatorColor: brightRed,
                        labelColor: brightRed,
                        unselectedLabelColor: Colors.white,
                        tabs: const [
                          Tab(
                            text: 'Charecters',
                            icon: Icon(Icons.groups_3),
                          ),
                          Tab(
                            text: 'Weapon',
                            icon: Icon(Icons.handyman),
                          ),
                        ],
                      ),
                    ),
                  ),
                  pageIndex == 0
                      ? CharacterGirdBody(characters: characters)
                      : // TODO HERE ADD PAGE 2
                      const Center(
                          child: Text('Page 2'),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
