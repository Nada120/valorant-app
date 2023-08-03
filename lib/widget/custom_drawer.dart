import 'package:flutter/material.dart';

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
          ),
          customListTile(
            title: 'CALENDAR',
            icon: Icons.edit_calendar,
          ),
          customListTile(
            title: 'FAVORITE',
            icon: Icons.favorite,
          ),
          customListTile(
            title: 'EVENT',
            icon: Icons.celebration,
          ),
          const Spacer(
            flex: 3,
          ),
          customListTile(
            title: 'OUT',
            icon: Icons.logout,
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
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
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
