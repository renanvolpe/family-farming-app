import 'package:flutter/material.dart';
import 'package:organaki_app/modules/authentication/pages/login_page.dart';
import 'package:organaki_app/modules/home/pages/home_map_page.dart';
import 'package:organaki_app/modules/home/pages/home_orders_page.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int currentIndex = 0;

  void changeIndexNavigator(int index) {
    setState(() => currentIndex = index);
  }

  final List<BarItem> barItems = [
    BarItem(
      text: 'Map',
      icon: Icons.home,
    ),
    BarItem(
      text: 'Orders',
      icon: Icons.history,
    ),
    BarItem(
      text: 'Account',
      icon: Icons.account_circle,
    ),
  ];

  final List<Widget> children = [
    const HomeMapPage(),
    const HomeOrdersPage(),
    const LoginPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: children),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: AnimatedBottomBar(
          barItems: barItems,
          onBarTap: changeIndexNavigator,
          indexNavigator: currentIndex,
        ),
      ),
    );
  }
}

class AnimatedBottomBar extends StatefulWidget {
  final List<BarItem>? barItems;
  final Function? onBarTap;
  final bool? isItemsPage;
  final String? pageKey;
  final bool? isAccountPage;
  final int? indexNavigator;

  const AnimatedBottomBar({
    super.key,
    this.barItems,
    this.onBarTap,
    this.isItemsPage,
    this.pageKey,
    this.isAccountPage,
    this.indexNavigator,
  });

  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar>
    with TickerProviderStateMixin {
  int selectedBarIndex = 0;
  Duration duration = const Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    selectedBarIndex = widget.indexNavigator ?? 0;
    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        color: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _buildBarItems(),
        ),
      ),
    );
  }

  List<Widget> _buildBarItems() {
    List<Widget> barItems = [];
    for (int i = 0; i < widget.barItems!.length; i++) {
      BarItem item = widget.barItems![i];

      //bool isSelected = selectedBarIndex == i;

      barItems.add(InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            selectedBarIndex = i;
            widget.onBarTap!(selectedBarIndex);
          });
        },
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          duration: duration,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: <Widget>[Icon(item.icon)],
              ),
              Row(
                children: [
                  Text(
                    item.text,
                  ),
                ],
              ),
            ],
          ),
        ),
      ));
    }
    return barItems;
  }
}

class BarItem {
  String text;
  IconData icon;

  BarItem({required this.text, required this.icon});
}
