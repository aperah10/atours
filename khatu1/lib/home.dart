import 'package:flutter/material.dart';
import 'package:khatu1/UniCommon/baseAppbar.dart';

import 'UniCommon/drawers.dart';
import 'UniCommon/pics.dart';
import 'Widget/btn.dart';
import 'Widget/formField.dart';
import 'util/style.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final TextEditingController? searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ! Sliver app Bar
          BaseSliverBar(
            // backgroundColor: orangeColor,
            title:
                //  Text(
                'Home',
            //   style: WhiteTextStyle,
            // ),
            // centerTitle: true,
            bottomChild: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 15.0),
                    child: SearchBox(
                      controller: searchController,
                    ),
                  ),
                )),
            // actions: <Widget>[
            //   IconButton(
            //     icon: const Icon(Icons.shopping_bag),
            //     tooltip: 'Cart', onPressed: () {},
            //     // onPressed: () => navigationPush(context, CartScreen()),
            //   ),
            // ],
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
                    title: 'Categoryname',
                  );
                }, childCount: 5)),
          ),
        ],
      ),
      drawer: DrawerScreen(),
    );
  }
}

// !  Horizontal List  for Category
class CategoryListItem extends StatelessWidget {
  CategoryListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ! Title Value
              Text(
                'Shop By Category',
                style: bigTextStyle,
              ),

              Btn(
                padding: EdgeInsets.only(left: 6, right: 6),
                height: 30,
                btnName: 'VIEW ALL',
                style: TextStyle(fontSize: 13, color: blackColor),
                color: Color.fromARGB(246, 200, 200, 214),
                // onTap: () => navigationPush(context, CategoryScreen()
                // ),
              ),
            ],
          ),
        ),
        Container(
          height: 150,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 15,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 8, right: 8, bottom: 5),
                child: InkWell(
                  // onTap: () => navigationPush(context, ProductShowScreen()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // ! Pic Section
                      Container(
                        child: Pics(
                          src: 'assets/images/COUPON.png',
                          height: 100,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // ! Bottom Name
                      Container(
                        margin: EdgeInsets.only(top: 2.0),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'name $i',
                          style: MediumTextStyle,
                        ),
                      ),
                      // // ! Bottom Name
                      // Container(
                      //   alignment: Alignment.bottomCenter,
                      //   child: Text(
                      //     '$i product',
                      //     style: smallTextStyle,
                      //   ),
                      // )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CategeoryGridProdList extends StatelessWidget {
  final String? title;
  final String? imageUrl;

  final dynamic onTap;
  final bool? fromSubProducts;
  const CategeoryGridProdList(
      {Key? key,
      this.title,
      this.imageUrl,
      this.onTap,
      this.fromSubProducts = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          // padding: EdgeInsets.only(top: 3),
          decoration: BoxDecoration(
              color: offWhiteColor,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: Color.fromARGB(255, 236, 234, 234),
              )),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    imageUrl!,
                    width: 150,
                    height: 100,
                    // padding: EdgeInsets.all(2),
                  ),
                ),
                Divider(),
                // ! title  and Subtitle for
                Container(
                  padding:
                      EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 2),
                  child: Text(
                    title!.length <= 40 ? title! : title!.substring(0, 40),
                    textAlign: TextAlign.left,
                    // fontSize: 15,
                    // fontWeight: FontWeight.bold,
                  ),
                )
              ]),
        ));
  }
}
