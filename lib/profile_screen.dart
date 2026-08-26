import 'package:flutter/material.dart';

class ProfileScreen
    extends
        StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<
    ProfileScreen
  >
  createState() => _ProfileScreenState();
}

class _ProfileScreenState
    extends
        State<
          ProfileScreen
        > {
  bool _notif = true;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(
          16,
        ),
        children: [
          _item(
            Icons.person,
            'Edit Profile',
            () {},
          ),
          _item(
            Icons.vpn_key,
            'Change Password',
            () {},
          ),
          _item(
            Icons.credit_card,
            'My Cards',
            () {},
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'App Settings',
            style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SwitchListTile(
            secondary: const Icon(
              Icons.notifications,
              color: Colors.brown,
            ),
            title: const Text(
              'Notifications',
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w500,
              ),
            ),
            value: _notif,
            activeThumbColor: Colors.deepOrange,
            onChanged:
                (
                  v,
                ) => setState(
                  () => _notif = v,
                ),
          ),
          _item(
            Icons.translate,
            'Language',
            () {},
            trailing: const Text(
              'English',
              style: TextStyle(
                color: Colors.brown,
              ),
            ),
          ),
          _item(
            Icons.logout,
            'Logout',
            () {},
          ),
        ],
      ),
    );
  }

  Widget _item(
    IconData icon,
    String title,
    VoidCallback onTap, {
    Widget? trailing,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.brown,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.brown,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing:
          trailing ??
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.brown,
          ),
      onTap: onTap,
    );
  }
}
