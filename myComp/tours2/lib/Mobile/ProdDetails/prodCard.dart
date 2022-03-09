import 'package:flutter/material.dart';
import 'package:tours2/Util/card.dart';
import 'package:tours2/Util/compart.dart';
import 'package:tours2/Util/common.dart';
import 'package:tours2/Util/style.dart';

// ! Product List builder
// class ProdList extends StatelessWidget {
//   final int? item;
//   final Widget? child;
//   ProdList({Key? key, this.item, this.child}) : super(key: key);

//   final List dl = List.generate(10, (index) => {'id': index, 'name': 'mango'});

//   @override
//   Widget build(BuildContext context) {
//     return CardDecoration(
//       color: offWhiteColor,
//       child: ListView.builder(
//           shrinkWrap: true,
//           itemCount: item ?? dl.length,
//           itemBuilder: (context, i) {
//             return Container(
//               child: child,
//             );
//           }),
//     );
//   }
// }

// ! CARD FORMAT
class CardFormat extends StatelessWidget {
  dynamic isReadmore;
  final Widget? child;
  dynamic onTap;
  final String? title;
  CardFormat(
      {Key? key, this.title = '', this.isReadmore, this.onTap, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardDecoration(
      brdWidth: 1,
      color: offWhiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ! TITLE NAME
          AllPd(
            onlyPd: true,
            bp: 3,
            lp: 10,
            tp: 3,
            child: ExpTxt(
              title!,
              style: labelTextStyle,
            ),
          ),
          Divider(),

          // ! Main Content
          Container(
            child: child,
          ),
          // ! End Content

          // ! BUTTON
          Container(
            child: isReadmore != 'Not'
                ? AllPd(
                    onlyPd: true,
                    lp: 25.0,
                    rp: 25.0,
                    tp: 3,
                    bp: 3,
                    child: BigButton(
                      title: isReadmore ? 'Read Less' : 'Read More',
                      onTap: onTap,
                    ),
                  )
                : null,
          )
        ],
      ),
    );
  }
}
