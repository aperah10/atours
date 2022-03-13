import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:khatu1/UniCommon/allSearchBox.dart';
import 'package:khatu1/UniCommon/baseAppbar.dart';
import 'package:khatu1/UniCommon/drawers.dart';
import 'package:khatu1/UniCommon/pics.dart';
import 'package:khatu1/Widget/btn.dart';
import 'package:khatu1/Widget/formField.dart';
import 'package:khatu1/util/common.dart';
import 'package:khatu1/util/style.dart';

import '../home.dart';

class HotelScreen extends StatelessWidget {
  HotelScreen({Key? key}) : super(key: key);

  final TextEditingController? searchController = TextEditingController();

  // List datalist = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

  final TextEditingController fromController = TextEditingController();

  final TextEditingController toController = TextEditingController();

  final TextEditingController roomController = TextEditingController();

  final TextEditingController adultsController = TextEditingController();

  final TextEditingController childrenController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // ! rister method
  _registerNow() async {
    var isvalid = formKey.currentState!.validate();
    if (!isvalid) {
      return 'Please Enter Valid Data';
    }

    print('from ${fromController.text}');
    print('to ${toController.text}');
    print('rooms ${roomController.text}');
    print('adluls ${adultsController.text}');
    print('children ${childrenController.text}');
    formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ! Sliver app Bar
          BaseSliverBar(
              title: 'Hotel',
              bottomChild: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      HotelSearchBox(
                        controller1: fromController,
                        controller2: toController,
                        listController1: roomController,
                        listController2: adultsController,
                        listController3: childrenController,
                      ),
                      Btn(
                        height: 40,
                        width: getWidth(context) / 2.15,
                        color: Colors.blue,
                        btnName: 'Search',
                        onTap: _registerNow,
                      ),
                    ],
                  ),
                ),
              )),

          // SliverList(
          //   delegate:
          //       SliverChildListDelegate([ImgSlider(), CategoryListItem()]),
          // ),

          // ! First List
          SliverPadding(
            padding: const EdgeInsets.all(3),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Divider(),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Special Offers ',
                        style: bigTextStyle,
                      )),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(5.0),
            sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.9),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  return CategeoryGridProdList(
                    // onTap: () => navigationPush(context, ProductShowScreen()),
                    imageUrl: 'assets/images/COUPON.png',
                    title: 'Hotel Category List',
                  );
                }, childCount: 5)),
          ),
        ],
      ),
      drawer: DrawerScreen(),
    );
  }

  // Future pickDateRange(BuildContext context) async {
  //   final newDateRange = await showDateRangePicker(
  //     context: context,
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime.now().add(Duration(days: 14)),
  //     // initialDateRange: dateRange
  //     // ?? initialDateRange,
  //   );

  //   if (newDateRange == null) return;

  //   print('NewdateRange $newDateRange');
  //   print('--------------------------------');
  //   if (newDateRange != null) {
  //     setState(() {
  //       // dateRange = newDateRange;
  //       var mon = DateFormat('dd/MMM/yy').format(newDateRange.start);

  //       fromController.text = DateFormat('dd-MMM').format(newDateRange.start);
  //       toController.text = DateFormat('dd-MMM').format(newDateRange.end);
  //       // servingDateTo = DateFormat('yyyy-MM-dd').format(newDateRange.end);
  //       // servingDateFrom = DateFormat('yyyy-MM-dd').format(newDateRange.start);
  //     });
  //   }
  // }
}

// ! Food Screen In
class FoodScreen extends StatelessWidget {
  FoodScreen({Key? key}) : super(key: key);
  final TextEditingController? searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ! Sliver app Bar
          BaseSliverBar(
            // boolLeading: false,
            title: 'Food',
            bottomChild: SearchBox(
              controller: searchController,
            ),
          ),

          SliverList(
            delegate:
                SliverChildListDelegate([ImgSlider(), CategoryListItem()]),
          ),

          // ! First List
          SliverPadding(
            padding: const EdgeInsets.all(3),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Divider(),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Special Offers ',
                        style: bigTextStyle,
                      )),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(5.0),
            sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.9),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  return CategeoryGridProdList(
                    // onTap: () => navigationPush(context, ProductShowScreen()),
                    imageUrl: 'assets/images/COUPON.png',
                    title: 'Hotel Category List',
                  );
                }, childCount: 5)),
          ),
        ],
      ),
      drawer: DrawerScreen(),
    );
  }
}

// ! Car Bus Screen
class CarBusScreen extends StatelessWidget {
  const CarBusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// ! Parking Screen
class ParkingScreen extends StatelessWidget {
  const ParkingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// ! RoadMap and SocialMidia
class SocialRoadScreen extends StatelessWidget {
  const SocialRoadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
