import 'package:flutter/material.dart';
import 'package:tours/Mobile/Exrta/prodCard.dart';
import 'package:tours/Util/buttons.dart';
import 'package:tours/Util/common.dart';
import 'package:tours/Util/style.dart';

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
          AminitiesScr(
            callback: widget.callback,
            isReadmore: false,
            itemLength: 4,
          ),
          // ! Amimitesi
          heightSizedBox(10),
          GuestReviewScr(
            callback: widget.callback,
            isReadmore: false,
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
  final int? itemLength;
  AminitiesScr({Key? key, this.isReadmore, this.itemLength, this.callback})
      : super(key: key);
  final List dl = List.generate(10, (index) => {'id': index, 'name': 'mango'});

  @override
  Widget build(BuildContext context) {
    return CardFormat(
      title: 'Facilites',
      isReadmore: isReadmore,
      onTap: () => callback!('Amenities'),
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
  Function? callback;
  dynamic isReadmore;
  final int? itemLength;
  GuestReviewScr({Key? key, this.isReadmore, this.itemLength, this.callback})
      : super(key: key);
  final List dl = List.generate(10, (index) => {'id': index, 'name': 'mango'});

  @override
  Widget build(BuildContext context) {
    return AllPd(
      pd: 5,
      child: CardFormat(
        title: 'Guest Reviews',
        isReadmore: isReadmore,
        onTap: () => callback!('Guest Reviews'),
        child: CardDec(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AllPd(
                onlyPd: true,
                bp: 10,
                lp: 10,
                child: CardDec(
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
                child: CardDec(
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
