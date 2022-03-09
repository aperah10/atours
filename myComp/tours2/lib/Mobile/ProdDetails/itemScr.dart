import 'package:flutter/material.dart';
import 'package:tours2/Mobile/ProdDetails/prodCard.dart';

import 'package:tours2/Util/card.dart';
import 'package:tours2/Util/compart.dart';
import 'package:tours2/Util/common.dart';
import 'package:tours2/Util/style.dart';

// ! Overview Screen
class OverViewScr extends StatefulWidget {
  Function? callback;

  OverViewScr({Key? key, this.callback}) : super(key: key);

  @override
  State<OverViewScr> createState() => _OverViewScrState();
}

class _OverViewScrState extends State<OverViewScr> {
  bool isReadmore = false;
  bool isReadmore2 = false;
  bool isReadmore3 = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CardFormat(
            title: 'Description',
            isReadmore: isReadmore,
            onTap: () {
              setState(() {
                isReadmore = !isReadmore;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: ExpTxt(
                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                isReadmore: isReadmore,
                style: smallTextStyle,
              ),
            ),
          ),
          heightSizedBox(10),
          // !2. Aminites Screen
          // CardFormat(
          //   title: 'Facilites',
          //   isReadmore: isReadmore2,
          //   onTap: () {
          //     setState(() {
          //       widget.callback!('Amenities');
          //       isReadmore2 = !isReadmore2;
          //     });
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          //     child: ListView.builder(
          //         shrinkWrap: true,
          //         itemCount: 3,
          //         itemBuilder: (context, i) {
          //           return Row(
          //             children: [
          //               Text('Home $i'),
          //               IconC(icon: Icons.ac_unit, size: 20)
          //             ],
          //           );
          //         }),
          //   ),
          // ),
          AminitiesScr(
            onTap: () {
              widget.callback!('Amenities');
              isReadmore2 = !isReadmore2;
            },
            // callback: widget.callback!('Amenities'),
            isReadmore: isReadmore2,
            itemLength: 4,
          ),
          // ! Amimitesi
          heightSizedBox(10),
          CardFormat(
            title: 'Guest Reviews',
            isReadmore: 'Not',
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, i) {
                  return Row(
                    children: [
                      Text('Home $i'),
                      IconC(icon: Icons.ac_unit, size: 20)
                    ],
                  );
                }),
          ),

          heightSizedBox(10),
          CardFormat(
            title: 'Guest Reviews',
            isReadmore: 'Not',
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, i) {
                  return Row(
                    children: [
                      Text('Home $i'),
                      IconC(icon: Icons.ac_unit, size: 20)
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}

// ! Aminiteis
class AminitiesScr extends StatelessWidget {
  Function? callback;
  dynamic isReadmore;
  dynamic onTap;
  final int? itemLength;
  AminitiesScr(
      {Key? key, this.onTap, this.isReadmore, this.itemLength, this.callback})
      : super(key: key);

//   @override
//   State<AminitiesScr> createState() => _AminitiesScrState();
// }

// class _AminitiesScrState extends State<AminitiesScr> {
  final List dl = List.generate(10, (index) => {'id': index, 'name': 'mango'});

  @override
  Widget build(BuildContext context) {
    return CardFormat(
      title: 'Facilites',
      isReadmore: isReadmore,
      onTap: onTap ??
          () {
            // setState(() {
            callback!('Amenities');
            // });
          },
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: itemLength ?? dl.length,
            itemBuilder: (context, i) {
              return Row(
                children: [
                  Text('Home $i'),
                  IconC(icon: Icons.ac_unit, size: 20)
                ],
              );
            }),
      ),
    );
  }
}

// !
class GuestReviewScr extends StatelessWidget {
  // Function? callback;
  dynamic isReadmore;

  dynamic onTap;
  GuestReviewScr({
    Key? key,
    this.onTap,
    this.isReadmore,
    // this.callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AllPd(
      pd: 5,
      child: CardFormat(
        title: 'Reviews',
        // isReadmore: isReadmore,
        isReadmore: 'Not',
        onTap: onTap ??
            () {
              // callback!('Reviews');
            },
        child: CardDecoration(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AllPd(
                onlyPd: true,
                bp: 10,
                lp: 10,
                child: CardDecoration(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ExpTxt('4.4 / 5'),
                      ExpTxt('410 Ratings'),
                      ExpTxt('178 Reviews'),
                    ],
                  ),
                ),
              ),
              AllPd(
                onlyPd: true,
                bp: 10,
                rp: 10,
                tp: 10,
                child: CardDecoration(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ratingData('5', value: .25, number: 253),
                      ratingData('4', value: .10, number: 21),
                      ratingData('3', value: .99, number: 300),
                      ratingData('2', value: .58, number: 8),
                      ratingData('1', value: 0.70, number: 135),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget ratingData(String title, {Color? color, double? value, int? number}) {
    return Row(
      children: [
        ExpTxt(title),
        IconC(
          icon: Icons.star,
          color: color,
        ),
        Container(
          width: 90,
          child: LinearProgressIndicator(
            color: Colors.blue,
            backgroundColor: offWhiteColor,
            // valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
            value: value,
          ),
        ),
        ExpTxt(number.toString())
      ],
    );
  }
}

class StarNumber extends StatelessWidget {
  final String title;
  final Color? color;
  final double? value;
  final int? number;
  StarNumber(this.title, {Key? key, this.color, this.number, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ExpTxt(title),
        IconC(
          icon: Icons.star,
          color: color,
        ),
        Container(
          width: 90,
          child: LinearProgressIndicator(
            color: Colors.blue,
            backgroundColor: offWhiteColor,
            // valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
            value: value,
          ),
        ),
        ExpTxt(number.toString())
      ],
    );
  }
}
