import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/characters_provider.dart';

// constant
import '../constant/colors.dart';

// models
import '../models/characters_model.dart';

// services
import '../service/characters_service.dart';

// custom widgets
import '../widget/characters_gird.dart';
import '../widget/custom_drawer.dart';
import '../widget/custom_loading.dart';
import '../widget/sticker_image.dart';
import '../widget/custom_app_bar.dart';
import '../widget/show_error.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> with TickerProviderStateMixin {
  CharacterService service = CharacterService();
  late Future<List<Character>> characters = service.getCharacters();
  late TabController _tabController;
  int indexPage = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CharactersProvider>(context);
    provider.fetchData();
    // return provider.characters.isEmpty
    // ? provider.isLoading()
    // : buildUI(
    //     character: provider.characters,
    //   );

    return FutureBuilder(
      future: characters,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CustomLoading(
            size: 20,
            colors: [darkRed, teal, brightRed],
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return buildUI(character: snapshot.data!);
          }
        }
        return const ShowError();
      },
    );
  }

  
buildUI({required List<Character> character}) {
  return DefaultTabController(
    length: 2,
    child: Scaffold(
      appBar: customAppBar(
        iconColor: Colors.white,
        iconData: Icons.search_outlined,
        backColor: darkGray,
        process: () {
          // TODO Here
        },
      ),
      drawer: CustomDrawer(
        backColor: darkRed,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                child: customTabBar,
              ),
            ),
            indexPage == 0
            ? CharacterGirdView(character: character)
            : // TODO HERE ADD PAGE 2 
            const Center(
                  child: Text('Page 2'),
                ),
          ],
        ),
      ),
    ),
  );
}

TabBar get customTabBar => TabBar(
  controller: _tabController,
  indicatorColor: brightRed,
  labelColor: brightRed,
  unselectedLabelColor: Colors.white,
  onTap: (index) {
    setState(() {
      indexPage = index;
    });
  },
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
);
}

