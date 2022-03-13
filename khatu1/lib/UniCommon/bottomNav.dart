import 'package:flutter/material.dart';
import 'package:khatu1/Product/ProdHomeScr.dart';
import 'package:khatu1/util/style.dart';

import '../home.dart';

class UserNavigationBar extends StatefulWidget {
  final int? sellerId;
  int? currentTab;
  Widget? currentPage;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  UserNavigationBar({Key? key, this.currentTab, this.sellerId}) {
    if (currentTab == null) currentTab = 0;
  }
  @override
  _UserNavigationBarState createState() => _UserNavigationBarState();
}

class _UserNavigationBarState extends State<UserNavigationBar> {
  @override
  initState() {
    super.initState();
    _selectTab(widget.currentTab!);
  }

  void _selectTab(int tabItem) {
    setState(() {
      widget.currentTab = tabItem;
      switch (tabItem) {
        case 0:
          widget.currentPage = HotelScreen();
          break;
        case 1:
          widget.currentPage = FoodScreen(
              // sellerId: widget.sellerId,
              );
          break;
        case 2:
          widget.currentPage = CarBusScreen(
              // sellerId: widget.sellerId,
              );
          break;
        case 3:
          widget.currentPage = SocialRoadScreen();

          break;
        case 4:
          widget.currentPage = ParkingScreen();
          // widget.currentPage = SelGeneratePromoCodes(sellerId: widget.sellerId);
          break;
        // case 5:
        //   widget.currentPage = Profile();
        //   break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      body: widget.currentPage,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: darkBlueColor,
        // selectedFontSize: 0,
        // unselectedFontSize: 0,
        unselectedItemColor: Colors.black38,
        iconSize: 25,
        backgroundColor: offWhiteColor,
        currentIndex: widget.currentTab!,
        showSelectedLabels: true,
        selectedFontSize: 12,

        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(
            fontSize: 12, color: txtBlackColor, fontFamily: montserratMedium),

        unselectedLabelStyle: TextStyle(
            fontSize: 12, color: Colors.black38, fontFamily: montserratMedium),
        unselectedFontSize: 12,

        onTap: (int i) {
          this._selectTab(i);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: widget.currentTab == 0 ? darkBlueColor : Colors.black38,
              size: 22,
            ),
            label: 'Hotel',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.room_rounded,
              // color: widget.currentTab == 0 ? darkBlueColor : Colors.black38,
              size: 22,
            ),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.car_rental,
              // color: widget.currentTab == 0 ? darkBlueColor : Colors.black38,
              size: 22,
            ),
            label: 'Car/Bus',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              // color: widget.currentTab == 0 ? darkBlueColor : Colors.black38,
              size: 22,
            ),
            label: 'Pic/RoadMap',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              // color: widget.currentTab == 0 ? darkBlueColor : Colors.black38,
              size: 22,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
