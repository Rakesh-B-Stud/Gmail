import 'package:flutter/material.dart';
import 'pages/inbox_page.dart';
import 'pages/sent_page.dart';
import 'pages/drafts_page.dart';
import 'pages/settings_page.dart';

void main() {
  runApp(GmailCloneApp());
}

class GmailCloneApp extends StatefulWidget {
  @override
  _GmailCloneAppState createState() => _GmailCloneAppState();
}

class _GmailCloneAppState extends State<GmailCloneApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    InboxPage(),
    SentPage(),
    DraftsPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gmail Clone',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black54,
        ),
      ),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu, color: Colors.black),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),
                  Image.asset('assets/gmail_logo.png', height: 30),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 10),
                          Text(
                            'Search in mail',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/profile.png'),
                    radius: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: Builder(
  builder: (context) => Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text('Yuktha'),
          accountEmail: Text('Yuktha143@gmail.com'),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('assets/profile.png'),
          ),
          decoration: BoxDecoration(color: Colors.red),
        ),
        ListTile(
          leading: const Icon(Icons.inbox),
          title: const Text('Inbox'),
          onTap: () {
            _onItemTapped(0);
            Navigator.pop(context);  // This context belongs to the drawer now and will close it
          },
        ),
        ListTile(
          leading: const Icon(Icons.send),
          title: const Text('Sent'),
          onTap: () {
            _onItemTapped(1);
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.drafts),
          title: const Text('Drafts'),
          onTap: () {
            _onItemTapped(2);
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
            _onItemTapped(3);
            Navigator.pop(context);
          },
        ),
      ],
    ),
  ),
),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.inbox), label: 'Inbox'),
            BottomNavigationBarItem(icon: Icon(Icons.send), label: 'Sent'),
            BottomNavigationBarItem(icon: Icon(Icons.drafts), label: 'Drafts'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          child: const Icon(Icons.edit),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Compose New Mail')),
            );
          },
        ),
      ),
    );
  }
}
