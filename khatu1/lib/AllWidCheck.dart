import 'package:flutter/material.dart';

import 'UniCommon/allMenu.dart';
import 'UniCommon/content.dart';
import 'UniCommon/item_Header_Footer.dart';
import 'UniCommon/pics.dart';
import 'Widget/btn.dart';
import 'Widget/formField.dart';
import 'util/common.dart';

class CheckAllWidget extends StatefulWidget {
  CheckAllWidget({Key? key}) : super(key: key);

  @override
  State<CheckAllWidget> createState() => _CheckAllWidgetState();
}

class _CheckAllWidgetState extends State<CheckAllWidget> {
  List datalist = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

  TextEditingController roomsController = TextEditingController();
  dynamic isReadmore = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: EditTextField(
                  hintText: 'HintText',
                ),
              ),
              Container(
                width: getWidth(context) / 2.15,
                child: DropDownBtn(
                  labelText: 'home',
                  listData: datalist,
                  pageName: 'Rooms',
                  listController: roomsController,
                ),
              ),
              Btn(
                height: 40,
                width: getWidth(context) / 2.15,
                color: Colors.blue,
                btnName: 'Search',
              ),
              heightSizedBox(10.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchBox(
                  controller: roomsController,
                ),
              ),
              Center(child: CartBtn()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilterMenu(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ServicesMenu(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FavourMenu(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PicHorizontalList(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Column(
                    children: [
                      ItemHeader(
                        title: 'Food /Shop',
                      ),
                      PicTxtContent(isReadmore: isReadmore),
                      ItemFooter(onTap1: () {
                        if (isReadmore == false) {
                          setState(() {
                            isReadmore = true;
                          });
                        } else {
                          setState(() {
                            isReadmore = false;
                          });
                        }
                      }
                          // btn2: 'btn2',
                          ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
