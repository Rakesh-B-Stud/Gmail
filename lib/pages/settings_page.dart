import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 12),
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Text(
            'Account Settings',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
        const ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/profile.png'),
            radius: 20,
          ),
          title: Text('example@gmail.com'),
          subtitle: Text('Google Account'),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
        const Divider(),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Text(
            'App Settings',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
        const ListTile(
          leading: Icon(Icons.notifications),
          title: Text('Notifications'),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
        const ListTile(
          leading: Icon(Icons.lock),
          title: Text('Privacy & Security'),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
        const Divider(),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Text(
            'Support',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
        const ListTile(
          leading: Icon(Icons.help_outline),
          title: Text('Help & Feedback'),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
        const ListTile(
          leading: Icon(Icons.info_outline),
          title: Text('About'),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
      ],
    );
  }
}
