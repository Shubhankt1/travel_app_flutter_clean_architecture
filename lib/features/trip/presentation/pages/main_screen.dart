import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerWidget {
  MainScreen({super.key});

  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _pageController.addListener(() {
      _currentPage.value = _pageController.page!.round();
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 100,
        backgroundColor: Colors.teal[700],
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Shubhank 👋🏻',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Travelling Today?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: const [
          Text('1'),
          Text('2'),
          Text('3'),
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _currentPage,
        builder: (BuildContext context, index, Widget? child) {
          return BottomNavigationBar(
            currentIndex: index,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.list_rounded),
                label: 'My Trips',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Add Trip',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map_rounded),
                label: 'Maps',
              ),
            ],
            onTap: (index) {
              _pageController.jumpToPage(index);
            },
          );
        },
      ),
    );
  }
}
