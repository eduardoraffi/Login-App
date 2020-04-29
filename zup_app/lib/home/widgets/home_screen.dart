import 'package:flutter/material.dart';
import 'package:zupapp/feed/screen/feed_screen.dart';
import 'package:zupapp/profile/screen/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex;
  List<Widget> screenList;

  @override
  void initState() {
    _selectedIndex = 0;
    screenList = [FeedScreen(), ProfileScreen()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: _getApplicationBar(),
        backgroundColor: Color(0xff8EC663),
        body: screenList.elementAt(_selectedIndex),
        bottomNavigationBar: _getBottomNavigationBar());
  }

  _getBottomNavigationBar() => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.devices_other),
              title: Text(
                'Lista de\nEmpregos',
                textAlign: TextAlign.center,
              )),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text('Perfil\n'),
          )
        ],
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        backgroundColor: Color(0xff003054),
        elevation: 5,
        unselectedItemColor: Colors.white70,
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onListTap,
      );

  _onListTap(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _getApplicationBar() => AppBar(
        title: Image(
          height: MediaQuery.of(context).size.height * 0.05,
          image: AssetImage("assets/images/app_logo.png"),
          color: Colors.white,
        ), //Text((_selectedIndex == 0) ? 'Feed de empregos' : 'Perfil'),
        centerTitle: true,
        elevation: 5,
        backgroundColor: Color(0xff003054),
      );
}
