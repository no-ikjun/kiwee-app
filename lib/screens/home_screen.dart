import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiwee/screens/home_widget/food_select.dart';
import 'package:kiwee/screens/home_widget/menu_list.dart';
import 'package:kiwee/screens/home_widget/order_history.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  static const List<Widget> _widgetOptions = <Widget>[
    FoodSelect(),
    MenuList(),
    OrderHistory(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfffcfcfc),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFFFFFFF),
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/store_${_selectedIndex == 0 ? 'green' : 'grey'}.svg',
              width: 25,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/home_${_selectedIndex == 1 ? 'green' : 'grey'}.svg',
              width: 25,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/list_${_selectedIndex == 2 ? 'green' : 'grey'}.svg',
              width: 25,
            ),
            label: "",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
