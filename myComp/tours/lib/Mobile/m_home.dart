import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tours/Common/dash_Board.dart';
import 'package:tours/Common/txt.dart';
import 'package:tours/Util/buttons.dart';
import 'package:tours/Util/common.dart';
import 'package:tours/Util/style.dart';

class HomePageScr extends StatelessWidget {
  HomePageScr({Key? key}) : super(key: key);

  TextEditingController dateFrom = TextEditingController();
  TextEditingController dateTo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ! DRAWER FOR HOME PAGE
        drawer: Icon(Icons.drafts),
        appBar: AppBar(
          title: Container(
            width: getWidth(context) / 1.5,
            color: offWhiteColor,
            child: CupertinoSearchTextField(
              onChanged: (String value) {
                print(value);
              },
              onSubmitted: (String value) {
                print('submit ' + value);
              },
            ),
          ),
          actions: [
            Icon(
              Icons.notification_add,
            ),
            widthSizedBox(10),
            Icon(
              Icons.shopping_cart,
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromRadius(60),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                children: [
                  // ! search Item
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    color: offWhiteColor,
                                    // width: getWidth(context) / 2.5,
                                    child: SellerEditFormFields(
                                      labelText: '    From',
                                      placeholder: '  4-May',
                                      controller: dateFrom,
                                      readOnly: true,
                                      fieldAble: false,
                                      // validator: (v) => formvalid.reqField(v),
                                      sufIcon: Icon(Icons.calendar_today,
                                          size: 18, color: redColor),
                                      // onTap: () => pickDateRange(context),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    color: offWhiteColor,
                                    // width: getWidth(context) / 2.5,
                                    child: SellerEditFormFields(
                                      labelText: '    To',
                                      placeholder: '  8-May',
                                      controller: dateTo,
                                      readOnly: true,
                                      fieldAble: false,
                                      // onTap: _selectDateFrom,
                                      // onTap: () => pickDateRange(context),
                                      // validator: (v) => ,
                                      sufIcon: Icon(Icons.calendar_today,
                                          size: 18, color: redColor),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  color: offWhiteColor,
                                  // width: getWidth(context) / 3,
                                  child: SellerEditFormFields(
                                    labelText: 'Rooms',
                                    placeholder: '1',

                                    controller: dateTo,

                                    readOnly: true,
                                    fieldAble: false,
                                    // onTap: _selectDateFrom,
                                    // onTap: () => pickDateRange(context),
                                    // validator: (v) => ,
                                    sufIcon: Icon(
                                        Icons.arrow_drop_down_circle_sharp,
                                        size: 15,
                                        color: redColor),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  color: offWhiteColor,
                                  child: SellerEditFormFields(
                                    labelText: 'Adults',
                                    placeholder: '1',

                                    controller: dateTo,

                                    readOnly: true,
                                    fieldAble: false,
                                    // onTap: _selectDateFrom,
                                    // onTap: () => pickDateRange(context),
                                    // validator: (v) => ,
                                    sufIcon: Icon(
                                        Icons.arrow_drop_down_circle_sharp,
                                        size: 15,
                                        color: redColor),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  color: offWhiteColor,
                                  child: SellerEditFormFields(
                                    labelText: 'Children',
                                    placeholder: '1',

                                    controller: dateTo,

                                    readOnly: true,
                                    fieldAble: false,
                                    // onTap: _selectDateFrom,
                                    // onTap: () => pickDateRange(context),
                                    // validator: (v) => ,
                                    sufIcon: Icon(
                                        Icons.arrow_drop_down_circle_sharp,
                                        size: 15,
                                        color: redColor),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  // ! Buttons
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      decoration: BoxDecoration(color: offWhiteColor),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sort',
                              style: labelTextStyle,
                            ),
                            Text(
                              'Filter',
                              style: labelTextStyle,
                            ),
                            Text(
                              'Custom',
                              style: labelTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black12),
                    child: HorizontalScrollView(),
                    height: MediaQuery.of(context).size.height * .15,
                  ),
                ),

                VerticalFeed(), //Doesn't work
              ],
            ),
          ),
        ));
  }
}

class VerticalFeed extends StatelessWidget {
  dynamic controller;
  VerticalFeed({Key? key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(
        controller: controller,
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (ctx, i) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.account_circle),
                            Text('Username $i'),
                          ],
                        ),
                        Icon(Icons.more_horiz)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.red,
                        height: 100,
                        width: 150,
                        child: Image.asset('assets/images/COUPON.jpg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Hotel Name', style: labelTextStyle),
                            Text('Distance 1.2km from KhatuShaymji Temple',
                                style: smallTextStyle),
                            Row(
                              children: [
                                Text('ratings  ', style: labelTextStyle),
                                Text('2.5 / 5', style: smallTextStyle),
                              ],
                            ),
                            Row(
                              children: [
                                Text('500', style: labelTextStyle),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Txt(
                                    '900',
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(child: BigButton(title: 'Cart')),
                        Expanded(child: BigButton(title: 'Book Now')),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HorizontalScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (ctx, i) => Container(
        width: 150,
        child: Column(
          children: [
            Container(
              color: Colors.green,
              width: 150,
              height: 90,
              child: Image.asset('assets/images/COUPON.jpg',
                  width: 150, height: 90),
            )
          ],
        ),
      ),
      itemCount: 30,
    );
  }
}
