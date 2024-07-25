import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constant/colors.dart';
import '../logic/cubit/weapons_cubit.dart';
import '../widget/global/custom_loading.dart';
import '../widget/global/show_error.dart';
import '../widget/weapons page/weapons_body.dart';

class WeaponsPage extends StatelessWidget {
  const WeaponsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeaponsCubit, WeaponsState>(
      builder: (context, state) {
        var provider = context.read<WeaponsCubit>();
        if (state is WeaponsLoaded) {
          return WeaponsBody(weapons: provider.weapons);
        } else if (state is WeaponsFaluire) {
          return const ShowError();
        } else {
          return CustomLoading(
            size: 20,
            colors: [
              darkRed,
              teal,
              brightRed,
            ],
          );
        }
      },
    );
  }
}
