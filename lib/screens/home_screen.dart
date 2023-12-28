import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'first_screen.dart';
import 'second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: unused_field
  int _counter = 0;
  int _currentIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final Map<String, Icon> _navigationItems = {
    'Menu': Platform.isIOS
        ? const Icon(CupertinoIcons.house_fill)
        : const Icon(Icons.home),
    'Pedido': Icon(Icons.adaptive.share),
  };

  final Map<String, Widget> _screens = {
    'Menu': const FirstScreen(),
    'Pedido': const SecondScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Platform.isIOS ? Colors.transparent : null,
        shadowColor: Platform.isIOS ? CupertinoColors.darkBackgroundGray : null,
        scrolledUnderElevation: Platform.isIOS ? .1 : null,
        toolbarHeight: Platform.isIOS ? 44 : null,
        backgroundColor: const Color(0xFFFF800B),
        title: Text(widget.title),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens.values.toList(),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: _incrementCounter,
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Platform.isIOS
          ? CupertinoTabBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() => _currentIndex = index);
              },
              items: _screens.keys
                  .map<BottomNavigationBarItem>(
                    (key) => BottomNavigationBarItem(
                      icon: _navigationItems[key]!,
                      label: key,
                    ),
                  )
                  .toList(),
            )
          : BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() => _currentIndex = index);
              },
              items: _screens.keys
                  .map<BottomNavigationBarItem>(
                    (key) => BottomNavigationBarItem(
                      icon: _navigationItems[key]!,
                      label: key,
                    ),
                  )
                  .toList(),
            ),
    );
  }
}
