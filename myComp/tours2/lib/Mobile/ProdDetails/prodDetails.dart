import 'package:flutter/material.dart';
import 'package:tours2/Mobile/ProdDetails/prodDetWid.dart';
import 'package:tours2/Util/style.dart';
import 'itemScr.dart';

// ! 1. Product Deatils Parent Screen
// ! 2. Product Deatils Content and Data Screen

// ! Product Deatils PARENT Screen
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

  // ! 1. Callback Function for Prod Details Bar Naviagtion
  void _navDeatilsFunction(String input) {
    print(' navDeatils Function $input');
    setState(() {
      mat = input;
    });
  }

  // ! 2. Callback Function for ReadMore More Button in Overview Scr
  void readMoreFunction(String input) {
    print(' readMore fucntion $input');
    setState(() {
      mat = input;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('mat data $mat');

    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Deatils Screen',
        style: appBarTS,
      )),
      body: Container(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          // !  1. Naviagtion of Product Bar
          ProductNav(),

          Flexible(
              child: Stack(
            children: [
              ListView(
                controller: _mainScrollController,
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                children: [
                  // ! 2. PICS ListView
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

                  // ! 3. Product Deatils Naviagtion Bar
                  ProdDeatilsNav(buttonHandler: _navDeatilsFunction, mat: mat),

                  // ! 4. Product Content or Data
                  Container(
                      child: ProductData(
                    mat: mat,
                    callback: readMoreFunction,
                    // buttonHandler: _navDeatilsFunction
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
              if (_isStickyOnTop) ProdDeatilsNav()
            ],
          ))
        ]),
      ),
    );
  }
}

// ! 2. Product Deatils Content and Data
class ProductData extends StatelessWidget {
  // dynamic buttonHandler;
  Function? callback;
  final dynamic mat;
  final dynamic subCon;
  final bool? isStickyOnTop;
  ProductData(
      {Key? key,
      this.callback,
      // this.buttonHandler,
      this.isStickyOnTop,
      this.mat,
      this.subCon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(controller: subCon, shrinkWrap: true, children: [
      Container(
        child: allData(),
        // child: OverViewScr(
        //   callback: callback,
        // ),
      )
    ]);
  }

  Widget? allData() {
    if (mat == 'Overview') {
      // print('Overviews ------------');
      // print('callback $callback');
      // print('mat $mat');
      return OverViewScr(
        callback: callback,
      );
    }
    if (mat == 'Amenities') {
      // print('Aminiteis-------------- ');
      // print('callback $callback');
      // print('mat $mat');
      return AminitiesScr(
        isReadmore: 'Not',
        // callback: callback,
      );
    }
    if (mat == 'Location') {
      return Center(
          child: Text(
        'No data',
      ));
    }
    if (mat == 'Reviews') {
      // print('Gusest Reviews ------------ ');
      // print('callback $callback');
      // print('mat $mat');
      return GuestReviewScr(
        isReadmore: 'Not',
        // callback: callback,
      );
    }
    return Center(child: Text('No data'));
  }
}
