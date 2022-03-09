import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:tours/Mobile/product.dart';
import 'package:tours/Util/buttons.dart';
import 'package:tours/Util/common.dart';
import 'package:tours/Util/style.dart';

import 'Exrta/itemScr.dart';
import 'Exrta/prodCard.dart';
import 'm_home.dart';

class ProductDeatilsScr extends StatefulWidget {
  ProductDeatilsScr({Key? key}) : super(key: key);

  @override
  State<ProductDeatilsScr> createState() => _ProductDeatilsScrState();
}

class _ProductDeatilsScrState extends State<ProductDeatilsScr> {
  ScrollController _mainScrollController = ScrollController();
  ScrollController _subScrollController = ScrollController();

  double _removableWidgetSize = 180;
  bool _isStickyOnTop = false;

  dynamic mat = 'Overview';

  @override
  void initState() {
    super.initState();
    _mainScrollController.addListener(() {
      if (_mainScrollController.offset >= _removableWidgetSize &&
          !_isStickyOnTop) {
        _isStickyOnTop = true;
        setState(() {});
      } else if (_mainScrollController.offset < _removableWidgetSize &&
          _isStickyOnTop) {
        _isStickyOnTop = false;
        setState(() {});
      }
    });
  }

  // ! passed Function
  void _passedFunction(String input) {
    print(' passed Function $input');
    setState(() {
      mat = input;
    });
  }

  void readFunction(String input) {
    print(' read fucntion $input');
    setState(() {
      mat = input;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Rooms',
        style: appBarTS,
      )),
      body: Container(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          // ! Hotel Data
          ProductHeadPart(),
          // ! PICS
          Flexible(
              child: Stack(
            children: [
              ListView(
                controller: _mainScrollController,
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                children: [
                  Container(
                    child: mat == 'Overview'
                        ? Container(
                            alignment: Alignment.center,
                            height: _removableWidgetSize,
                            width: double.infinity,
                            color: Colors.yellow,
                            child: ProductPics(),
                          )
                        : null,
                  ),

                  // ! Headers

                  OnlyHeader(buttonHandler: _passedFunction),
                  Container(
                      child: ProductData(
                    mat: mat,
                    callback: readFunction,
                  )),

                  // Container(
                  //   alignment: Alignment.center,
                  //   height: 180,
                  //   width: double.infinity,
                  //   color: Colors.yellow,
                  //   child: ProductPics(),
                  // ),
                ],
              ),
              if (_isStickyOnTop) OnlyHeader()
            ],
          ))
        ]),
      ),
    );
  }
}

class OnlyHeader extends StatefulWidget {
  final Function? buttonHandler;
  dynamic mat;
  OnlyHeader({Key? key, this.buttonHandler, this.mat}) : super(key: key);

  @override
  State<OnlyHeader> createState() => _OnlyHeaderState();
}

class _OnlyHeaderState extends State<OnlyHeader> {
  final List<dynamic> points = [
    'Overview',
    'Amenities',
    'Location',
    'Guest Reviews',
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

// ! headers
class ProductData extends StatelessWidget {
  Function? callback;
  final List<dynamic> points = [
    'Overview',
    'Amenities',
    'Location',
    'Guest Reviews',
    'Rule & Polices',
    'About Property'
  ];
  final dynamic mat;
  final dynamic subCon;
  final bool? isStickyOnTop;
  ProductData(
      {Key? key, this.callback, this.isStickyOnTop, this.mat, this.subCon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(controller: subCon, shrinkWrap: true, children: [
      Container(
        child: allData(),
      )
    ]);
  }

  Widget? allData() {
    if (mat == 'Overview') {
      return OverViewScr(
        callback: callback,
      );
    }
    if (mat == 'Amenities') {
      return AminitiesScr(
        isReadmore: 'Not',
      );
    }
    if (mat == 'Location') {
      return Center(
          child: Text(
        'No data',
      ));
    }
    if (mat == 'Guest Reviews') {
      return GuestReviewScr(
        isReadmore: 'Not',
        // callback: callback,
      );
    }
    return Center(child: Text('No data'));
  }
}
