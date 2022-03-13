import 'package:flutter/material.dart';
import 'package:khatu1/UniCommon/baseAppbar.dart';
import 'package:khatu1/util/style.dart';

import '../home.dart';

class ProdListScreen extends StatelessWidget {
  ProdListScreen({Key? key}) : super(key: key);
  final TextEditingController? searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ! Sliver app Bar
          BaseSliverBar(
            title: 'ProdList',
            // bottomChild: SearchBox(
            //   controller: searchController,
            // ),
          ),

          SliverList(
            delegate: SliverChildListDelegate([
              // ImgSlider(), CategoryListItem()
            ]),
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
                    title: 'ProdList Category List',
                  );
                }, childCount: 5)),
          ),
        ],
      ),
    );
  }
}
