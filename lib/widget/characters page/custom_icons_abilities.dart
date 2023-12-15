import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constant/colors.dart';
import '../../logic/cubit/ability_selection_cubit.dart';
import 'custom_text_details.dart';

class CustomIconsAbilities extends StatelessWidget {
  final List<dynamic> abilities;
  final double width;

  const CustomIconsAbilities({
    super.key,
    required this.abilities,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AbilitySelectionCubit(),
      child: BlocBuilder<AbilitySelectionCubit, int>(
        builder: (context, ability) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: abilities.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {
                        context
                            .read<AbilitySelectionCubit>()
                            .changeAbility(index);
                      },
                      child: Container(
                        color: ability == index
                            ? brightRed
                            : darkGray.withOpacity(0.4),
                        width: 40,
                        height: 30,
                        child: Image.network(
                          abilities[index]['displayIcon']!,
                          width: 30,
                          height: 30,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 6),
              setAbilities(
                title: abilities[ability]['displayName'],
                description: abilities[ability]['description'],
                width: width,
              ),
            ],
          );
        },
      ),
    );
  }
}
