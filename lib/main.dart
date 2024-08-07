import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/cubit/tab_controller_cubit.dart';
import 'logic/cubit/characters_cubit.dart';
import 'logic/cubit/weapons_cubit.dart';
import 'screens/characters_page.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: CharactersCubit()..getAllCharacters(),
          child: const CharactersPage(),
        ),
        BlocProvider(
          create: (context) => TabControllerCubit(),
        ), 
        BlocProvider(
          create: (context) => WeaponsCubit()..getWeapons(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VALORANT APP',
        home: HomePage(),
      ),
    );
  }
}
