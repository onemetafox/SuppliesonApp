
import 'package:customer_end/utils/baseClass.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:customer_end/views/screens/orders_module/current_order_page.dart';
import 'package:customer_end/views/screens/supplier_list/supplier_list_page.dart';
import 'package:flutter/material.dart';
import 'package:rolling_nav_bar/rolling_nav_bar.dart';

import 'accounts/accounts_page.dart';
import 'home_module/bottom_home_page.dart';
import 'more_module/bottom_more_page.dart';
import 'notification_module/bottom_notification_page.dart';
import 'orders_module/bottom_order_page.dart';

class HomeBasePage extends StatefulWidget {
  @override
  _HomeBasePageState createState() => _HomeBasePageState();
}

class _HomeBasePageState extends State<HomeBasePage> with BaseClass {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      left: false,
      right: false,
      child: Scaffold(
        bottomNavigationBar: _getCustomBottomBar(),
        body: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            /*BottomHomePage()*/SuppliersListPage(),
            /*BottomOrderPage()*/CurrentOrderPage(),

            BottomNotificationPage(),
            AccountPage(),
            BottomMorePage(),
          ],
        ),
      ),
    );
  }

  Widget _getCustomBottomBar(){
    return Container(
      height: Dimensions.pixels_56,
      width: getScreenWidth(context),
      child: RollingNavBar.iconData(
        baseAnimationSpeed: 50,

        activeIconColors: [
          Colors.white,
          Colors.white,
          Colors.white,
          Colors.white,
          Colors.white,
        ],
        indicatorColors: const <Color>[Colors.orange],
        onTap: (selectedIndex) {
          setState(() {
            _selectedIndex = selectedIndex;
          });

          // print(_selectedIndex);
        },
        // A list of length one implies the same color for all icons
        iconColors: <Color>[
          Colors.orange,
        ],
        iconData: <IconData>[
          Icons.home,
          Icons.bookmark_border,
          Icons.notifications,
          Icons.account_box,
          Icons.more_horiz_rounded
        ],
        iconText: <Widget>[
          _getBottomNavWidget("Home"),
          _getBottomNavWidget("Orders"),
          _getBottomNavWidget("Notification"),
          _getBottomNavWidget("Account"),
          _getBottomNavWidget("More"),
        ],
      ),
    );
  }

  Widget _getBottomNavWidget(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.orange,
        fontSize: Dimensions.pixels_12,
      ),
    );
  }
}