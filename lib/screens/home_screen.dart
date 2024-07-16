import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/history_meeting.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/buttons.dart';

import 'meetins.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget>  pages = [
    Meetings(),
    MeetingHistoryScreen(),
    const Text('contact'),
    const Text('settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text('Meetings', style: TextStyle(),),
        centerTitle: true,
      ),
      body: pages[_page],
      bottomNavigationBar: Theme(data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.white,
      ), child: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem( icon: Icon(Icons.video_call,), label: 'Meetings',),
          BottomNavigationBarItem(icon: Icon(Icons.comment_bank,), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outlined,), label: 'Contacts'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined,), label: 'Settings'),

        ],
      ),)
    );
  }
}