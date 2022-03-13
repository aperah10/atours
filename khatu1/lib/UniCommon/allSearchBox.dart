import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:khatu1/Widget/formField.dart';
import 'package:khatu1/util/common.dart';
import 'package:khatu1/util/input_validation.dart';
import 'package:khatu1/util/style.dart';

class HotelSearchBox extends StatefulWidget {
  final TextEditingController? controller1;
  final TextEditingController? controller2;
  final TextEditingController? listController1;
  final TextEditingController? listController2;
  final TextEditingController? listController3;
  List<dynamic>? listData1;
  List<dynamic>? listData2;
  List<dynamic>? listData3;
  dynamic onTap1, onTap2;

  HotelSearchBox(
      {Key? key,
      this.controller1,
      this.controller2,
      this.listController1,
      this.listController2,
      this.listController3,
      this.listData1,
      this.listData2,
      this.listData3,
      this.onTap1,
      this.onTap2})
      : super(key: key);

  @override
  State<HotelSearchBox> createState() => _HotelSearchBoxState();
}

class _HotelSearchBoxState extends State<HotelSearchBox> {
  List datalist = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: EditTextField(
                  controller: widget.controller1,
                  formBox: true,
                  hintText: 'From',
                  fillColor: offWhiteColor,
                  // filled: true,
                  onTap: widget.onTap1 ?? () => pickDateRange(context),
                  validator: validateField,
                  readOnly: true,
                  // fieldAble: false,
                  suffixIcon:
                      Icon(Icons.calendar_today, size: 15, color: redColor),
                ),
              ),
              widthSizedBox(3.0),
              Flexible(
                child: EditTextField(
                  controller: widget.controller2,
                  formBox: true,
                  hintText: 'To',
                  fillColor: offWhiteColor,
                  // filled: true,
                  onTap: widget.onTap2 ?? () => pickDateRange(context),
                  validator: validateField,
                  readOnly: true,
                  // fieldAble: false,
                  suffixIcon:
                      Icon(Icons.calendar_today, size: 15, color: redColor),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                child: DropDownBtn(
                  listData: widget.listData1 ?? datalist,
                  listController: widget.listController1,
                  pageName: 'Rooms',
                  fillColor: offWhiteColor,
                ),
              ),
              widthSizedBox(3.0),
              Flexible(
                child: DropDownBtn(
                  listData: widget.listData2 ?? datalist,
                  listController: widget.listController2,
                  pageName: 'Adults',
                  fillColor: offWhiteColor,
                ),
              ),
              widthSizedBox(3.0),
              Flexible(
                child: DropDownBtn(
                  listData: widget.listData3 ?? datalist,
                  listController: widget.listController3,
                  pageName: 'Children',
                  fillColor: offWhiteColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future pickDateRange(BuildContext context) async {
    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 14)),
      // initialDateRange: dateRange
      // ?? initialDateRange,
    );

    if (newDateRange == null) return;

    print('NewdateRange $newDateRange');
    print('--------------------------------');
    if (newDateRange != null) {
      setState(() {
        // dateRange = newDateRange;
        var mon = DateFormat('dd/MMM/yy').format(newDateRange.start);

        widget.controller1!.text =
            DateFormat('dd-MMM').format(newDateRange.start);
        widget.controller2!.text =
            DateFormat('dd-MMM').format(newDateRange.end);
        // servingDateTo = DateFormat('yyyy-MM-dd').format(newDateRange.end);
        // servingDateFrom = DateFormat('yyyy-MM-dd').format(newDateRange.start);
      });
    }
  }
}
