import 'package:flutter/material.dart';
import 'package:tours2/Util/card.dart';
import 'package:tours2/Util/compart.dart';
import 'package:tours2/Util/common.dart';
import 'package:tours2/Util/style.dart';

// class ProductDeatilsScr extends StatefulWidget {
//   ProductDeatilsScr({Key? key}) : super(key: key);

//   @override
//   State<ProductDeatilsScr> createState() => _ProductDeatilsScrState();
// }

// class _ProductDeatilsScrState extends State<ProductDeatilsScr> {
//   ScrollController _mainScrollController = ScrollController();
//   ScrollController _subScrollController = ScrollController();

//   double _removableWidgetSize = 180;
//   bool _isStickyOnTop = false;

//   @override
//   void initState() {
//     super.initState();
//     _mainScrollController.addListener(() {
//       if (_mainScrollController.offset >= _removableWidgetSize &&
//           !_isStickyOnTop) {
//         _isStickyOnTop = true;
//         setState(() {});
//       } else if (_mainScrollController.offset < _removableWidgetSize &&
//           _isStickyOnTop) {
//         _isStickyOnTop = false;
//         setState(() {});
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('======== $_isStickyOnTop');
//     return Scaffold(
//       appBar: AppBar(
//           title: Text(
//         'Rooms',
//         style: appBarTS,
//       )),
//       body: Container(
//         child:
//             Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
//           // ! Hotel Data
//           ProductHeadPart(),
//           // ! PICS
//           Flexible(
//               child: Stack(
//             // child: ListView(
//             children: [
//               ListView(
//                 controller: _mainScrollController,
//                 padding: EdgeInsets.all(0),
//                 shrinkWrap: true,
//                 children: [
//                   Container(
//                     alignment: Alignment.center,
//                     height: _removableWidgetSize,
//                     width: double.infinity,
//                     color: Colors.yellow,
//                     child: ProductPics(),
//                   ),

//                   // ! Headers
//                   OnlyHeaders(
//                     subCon: _subScrollController,
//                   ),

//                   // // ! Product Data
//                   ListView.builder(
//                       controller: _subScrollController,
//                       padding: EdgeInsets.only(top: 4),
//                       shrinkWrap: true,
//                       itemCount: 33,
//                       itemBuilder: (BuildContext context, int index) {
//                         return ProductCardPart1(prodNumber: index);
//                       }
//                       // children: [ProdDetails()]
//                       ),
//                   Column(
//                     children: [ProductCardPart1()],
//                   ),

//                   Container(
//                     alignment: Alignment.center,
//                     height: 180,
//                     width: double.infinity,
//                     color: Colors.yellow,
//                     child: ProductPics(),
//                   ),
//                 ],
//               ),
//               if (_isStickyOnTop) OnlyHeaders()
//             ],
//           ))
//         ]),
//       ),
//     );
//   }
// }

// // // ! headers
// class OnlyHeaders extends StatelessWidget {
//   final List<dynamic> points = [
//     'Overview',
//     'Amenities',
//     'Location',
//     'Guest Reviews',
//     'Rule & Polices',
//     'About Property'
//   ];
//   final dynamic subCon;
//   OnlyHeaders({Key? key, this.subCon}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       width: double.infinity,
//       // color: offWhiteColor,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         shrinkWrap: true,
//         itemBuilder: (ctx, i) => Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(
//                   top: 3.0, bottom: 6.0, left: 3.0, right: 3.0),
//               child: BigButton(
//                 color: blueColor,
//                 title: '${points[i]} ',
//                 onTap: () {
//                   print(points[i]);
//                 },
//               ),
//             ),
//           ],
//         ),
//         itemCount: points.length,
//       ),
//     );
//   }
// }

// // ! Product Content
// class ProdDetails extends StatefulWidget {
//   const ProdDetails({Key? key}) : super(key: key);

//   @override
//   State<ProdDetails> createState() => _ProdDetailsState();
// }

// class _ProdDetailsState extends State<ProdDetails> {
//   bool isReadmore = false;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CardDecoration(
//           color: redColor,
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ExpTxt(
//                 'title 1',
//                 style: labelTextStyle,
//               ),
//               ExpTxt(
//                 "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
//                 isReadmore: isReadmore,
//                 style: smallTextStyle,
//               ),
//               BigButton(
//                 title: isReadmore ? 'Read Less' : 'Read More',
//                 onTap: () {
//                   setState(() {
//                     isReadmore = !isReadmore;
//                   });
//                 },
//               )
//             ],
//           ),
//         ),
//         CardDecoration(
//           child: Text(
//             'title 2',
//             style: labelTextStyle,
//           ),
//         ),
//       ],
//     );
//   }
// }
