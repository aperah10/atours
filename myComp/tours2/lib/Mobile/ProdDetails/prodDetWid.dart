import 'package:flutter/material.dart';
import 'package:tours2/Util/card.dart';
import 'package:tours2/Util/common.dart';
import 'package:tours2/Util/compart.dart';
import 'package:tours2/Util/style.dart';

// ! 1. APP BAR NAVIGAION :- Rooms, Pacakge
// ! 2. DETAILS BAR NAVIAGTION  :- Overview, Aminiteis,Location
// ! 3. HORIZONTAL LIST VIEW For Pics

// ! NAVIAGTION BAR  IN APP BAR FOR SHOW SCREEN
class ProductNav extends StatelessWidget {
  const ProductNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomCenter,
        color: Colors.orange,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardHeader(
                  borderall: 5,
                )),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ! Roooms
                  Expanded(
                    child: BigButton(title: 'Rooms', icon: Icons.room_service),
                  ),
                  widthSizedBox(3),
                  // ! Roooms
                  Expanded(
                      child: BigButton(
                    title: 'Package',
                    icon: Icons.house_outlined,
                    color: blueColor,
                  )),
                ],
              ),
            )
          ],
        ));
  }
}

// ! Product Deatisl Naviagtion Menu of Sticky
class ProdDeatilsNav extends StatefulWidget {
  final Function? buttonHandler;
  dynamic mat;
  ProdDeatilsNav({Key? key, this.buttonHandler, this.mat}) : super(key: key);

  @override
  State<ProdDeatilsNav> createState() => _ProdDeatilsNavState();
}

class _ProdDeatilsNavState extends State<ProdDeatilsNav> {
  final List<dynamic> points = [
    'Overview',
    'Amenities',
    'Location',
    'Reviews',
    'Rule & Polices',
    'About Property'
  ];
  @override
  Widget build(BuildContext context) {
    // print('mat in header ${widget.mat}');
    return Container(
      height: 50,
      width: double.infinity,
      // color: offWhiteColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (ctx, i) => Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 3.0, bottom: 6.0, left: 3.0, right: 3.0),
              child: BigButton(
                color: blueColor,
                title: '${points[i]} ',
                onTap: () {
                  setState(() {
                    widget.mat = points[i];
                    widget.buttonHandler!(widget.mat.toString());
                  });
                },
              ),
            ),
          ],
        ),
        itemCount: points.length,
      ),
    );
  }
}

// !  3. HORIZONTAL LIST VIEW For P
class ProductPics extends StatelessWidget {
  ProductPics({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (ctx, i) => Container(
          width: 170,
          child: Column(
            children: [
              Container(
                color: Colors.green,
                child: Image.asset(
                  'assets/images/COUPON.jpg',
                ),
              )
            ],
          ),
        ),
        itemCount: 10,
      ),
    );
  }
}
