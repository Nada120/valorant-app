import 'package:flutter/material.dart';
import 'package:valorant_app/screens/favorite_page.dart';
import 'custom_date_picker.dart';
import 'custom_navigator.dart';

class CustomDrawer extends StatelessWidget {
  final Color backColor;
  const CustomDrawer({super.key, required this.backColor});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            child: Center(
              child: Icon(
                Icons.add_a_photo,
                size: 50,
                color: backColor,
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          customListTile(
            title: 'SETTING',
            icon: Icons.settings,
            process: (){} //pushPage(context, settingPage()),
          ),
          customListTile(
            title: 'CALENDAR',
            icon: Icons.edit_calendar,
            process: () async => await customDatePicker(context),
          ),
          customListTile(
            title: 'FAVORITE',
            icon: Icons.favorite,
            process: () {
              pushPage(context, const FavoritePage());
            }
          ),
          customListTile(
            title: 'EVENT',
            icon: Icons.celebration,
            process: () {} //pushPage(context, eventPage()),
          ),
          const Spacer(
            flex: 3,
          ),
          customListTile(
            title: 'OUT',
            icon: Icons.logout,
            process: () => popPage(context),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }

  Widget customListTile({
    required String title,
    required IconData icon,
    required void Function() process
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        onTap: process,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        leading: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
