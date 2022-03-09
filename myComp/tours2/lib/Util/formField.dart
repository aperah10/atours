import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tours2/Util/common.dart';
import 'package:tours2/Util/style.dart';
import 'package:intl/intl.dart';

class CusFormField extends StatefulWidget {
  final TextInputType? inputType;
  final String? placeholder;
  String? labelText;
  dynamic onSaved;
  dynamic onChanged;
  String? initValue;
  String? errorText;
  final fNumber;
  final Widget? sufIcon;
  final Widget? prefixIcon;
  double? vertical;
  double? horizontal;
  final List<TextInputFormatter>? inputFormatterData;
  final TextEditingController? controller;
  final Function? validator;
  String? timeName;
  bool? fieldAble;
  FocusNode? focusNode;
  int? maxLen;
  int? minLines;
  int? maxLines;
  bool? readOnly;
  dynamic onTap;
  bool? enabled;
  CusFormField(
      {Key? key,
      this.onTap,
      this.fNumber,
      this.vertical,
      this.horizontal,
      this.inputType,
      this.errorText,
      this.placeholder,
      this.controller,
      this.validator,
      this.labelText,
      this.onSaved,
      this.onChanged,
      this.initValue,
      this.prefixIcon,
      this.sufIcon,
      this.inputFormatterData,
      this.timeName,
      this.maxLines,
      this.fieldAble,
      this.focusNode,
      this.maxLen,
      this.minLines,
      this.readOnly,
      this.enabled})
      : super(key: key);

  @override
  _FieldFState createState() => _FieldFState();
}

class _FieldFState extends State<CusFormField> {
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

        widget.controller!.text =
            DateFormat('dd-MMM').format(newDateRange.start);
        widget.controller!.text = DateFormat('dd-MMM').format(newDateRange.end);

        // print('dateRange $dateRange');

        // print('NewdateRange ${newDateRange.start}, ${newDateRange.end}');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelText != null
            ? Text(widget.labelText!, style: labelTextStyle)
            : heightSizedBox(0.0),
        TextFormField(
            onTap: widget.onTap != null
                ? widget.onTap
                : () => pickDateRange(context),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            enabled: widget.enabled,
            maxLines: widget.maxLines,
            onChanged: widget.onChanged,
            inputFormatters: widget.inputFormatterData,
            initialValue: widget.initValue,
            enableInteractiveSelection:
                widget.fieldAble == true || widget.fieldAble == null
                    ? true
                    : false,
            minLines: widget.minLines,
            maxLength: widget.maxLen,

            // focusNode: FocusNode(),
            focusNode: widget.focusNode,
            controller: widget.controller,
            onSaved: widget.onSaved,
            keyboardType: widget.inputType,
            // validator: (value) => widget.formValidator!(value),
            validator: (value) => widget.validator!(value),
            autofocus: false,
            readOnly: widget.readOnly ?? false,
            scrollPadding: EdgeInsets.zero,
            decoration: InputDecoration(
                errorText: widget.errorText,
                counter: Offstage(),
                labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                // labelText: widget.labelText,
                contentPadding: EdgeInsets.symmetric(
                    vertical: widget.vertical != null ? widget.vertical! : 5.0,
                    horizontal: widget.horizontal ?? 0),
                isDense: true,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: offWhiteColor, width: 1.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                focusColor: Colors.black,
                hoverColor: Colors.black,
                prefixIconConstraints:
                    BoxConstraints(minWidth: 0, minHeight: 0),
                hintText: widget.placeholder,
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.sufIcon,
                suffixIconConstraints:
                    BoxConstraints.tightFor(width: 35.0, height: 14.0))),
      ],
    );
  }
}
