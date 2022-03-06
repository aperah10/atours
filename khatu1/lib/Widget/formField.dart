import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khatu1/Widget/btn.dart';
import 'package:khatu1/util/style.dart';

class FormFields extends StatelessWidget {
  final String? headTxt;
  final String? labelText;
  final TextEditingController? controller;
  final dynamic onTap;
  final Function? validator;
  final BoxDecoration? decoration;
  final Function(String)? onChanged;
  final int? maxLines;
  final int? maxLength;
  final String? initialValue;
  final Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final String? errorText;
  final Widget? suffixIcon;
  final String? hintText;
  final TextAlign? textAlign;
  final double? horizontal;
  final double? vertical;
  const FormFields(
      {Key? key,
      this.headTxt,
      this.textAlign,
      this.decoration,
      this.controller,
      this.labelText,
      this.errorText,
      this.focusNode,
      this.initialValue,
      this.inputFormatters,
      this.keyboardType,
      this.maxLength,
      this.maxLines,
      this.onChanged,
      this.onSaved,
      this.onTap,
      this.suffixIcon,
      this.hintText,
      this.validator,
      this.horizontal,
      this.vertical})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            child: headTxt != null
                ? Text(
                    headTxt!,
                    // style: labelTextStyle,
                  )
                : null),
        TextFormField(
            onTap: onTap,
            style: TextStyle(),
            textAlign: textAlign ?? TextAlign.start,
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: onChanged,
            inputFormatters: inputFormatters,
            initialValue: initialValue,
            // maxLines: maxLines,
            // minLines: minLines,
            maxLength: maxLength,

            // focusNode: FocusNode(),
            focusNode: focusNode,
            controller: controller,
            onSaved: onSaved,
            keyboardType: keyboardType,
            validator: (value) => validator!(value),
            // validator: validator,
            // autofocus: false,
            // readOnly: readOnly ?? false,
            scrollPadding: EdgeInsets.zero,
            decoration: InputDecoration(
              errorStyle: TextStyle(),
              errorText: errorText,
              counter: Offstage(),
              labelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              labelText: labelText,
              contentPadding: EdgeInsets.symmetric(
                  vertical: vertical ?? 10, horizontal: horizontal ?? 10),
              isDense: true,
              // focusedErrorBorder: UnderlineInputBorder(
              //   borderSide: BorderSide(
              //     width: 1.5,
              //     // color: Colors.black,
              //   ),
              // ),
              // errorBorder: UnderlineInputBorder(
              //     borderSide: BorderSide(color: Colors.black, width: 1.5)),
              // focusedBorder: UnderlineInputBorder(
              //   borderSide: BorderSide(color: Colors.black, width: 1.5),
              // ),
              // enabledBorder: UnderlineInputBorder(
              //   borderSide: BorderSide(color: Colors.black, width: 1.5),
              // ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.2),
              ),
              // border: UnderlineInputBorder(
              //     borderSide: BorderSide(color: Colors.black, width: 1.5)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.2),
              ),
              focusColor: Colors.black,
              hoverColor: Colors.black,
              prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
              hintText: hintText,
              // prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              suffixIconConstraints: BoxConstraints(
                minHeight: 0,
                minWidth: 0,
              ),
              // BoxConstraints.tightFor(width: 15.0, height: 10.0)
            )),
      ],
    );
  }
}

// ! DropDowN Field

class DropDownBtn extends StatefulWidget {
  final String? dName;
  final dynamic listData;
  final String pageName;
  String? currentItem;
  final String? labelText;
  final double? vertical;
  final double? horizontal;
  TextEditingController? listController = new TextEditingController();
  final dynamic onChanged;
  // String? Function(String?)? formValidator;
  // dynamic formValidator;
  final String? Function(dynamic)? formValidator;
  final dynamic selectedItemBuilder;

  DropDownBtn(
      {Key? key,
      this.selectedItemBuilder,
      this.labelText,
      this.dName,
      this.listData,
      this.vertical,
      this.horizontal,
      this.listController,
      this.pageName = '',
      this.formValidator,
      this.currentItem,
      this.onChanged})
      : super(key: key);

  @override
  _DropDownBtnState createState() => _DropDownBtnState();
}

class _DropDownBtnState extends State<DropDownBtn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelText != null
            ? Text(widget.labelText!, style: bigTextStyle)
            : SizedBox(height: 0.0),
        DropdownButtonFormField<dynamic>(
            // ! DROP DOWN MENU dropdownValue
            dropdownColor: Colors.white,
            // value: widget.currentItem,
            value: widget.listController!.text.isNotEmpty
                ? widget.listController!.text
                : widget.currentItem,
            validator: widget.formValidator,
            isExpanded: true,
            icon: const Icon(
              Icons.arrow_drop_down,
              size: 18,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            alignment: AlignmentDirectional.bottomEnd,
            iconSize: 18,
            elevation: 1,
            // style: smallTextStyle,
            onChanged: widget.onChanged != null
                ? widget.onChanged
                : (dynamic newValue) {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    setState(() {
                      widget.currentItem = newValue;
                      widget.listController!.text = newValue!;
                    });
                  },
            onTap: () {},
            selectedItemBuilder: widget.selectedItemBuilder,

            // items: widget.listData.toList(),
            items:
                //   widget.listData.map<DropdownMenuItem<String>>((String value) {
                // return DropdownMenuItem<String>(

                widget.listData.map<DropdownMenuItem>((dynamic value) {
              return DropdownMenuItem(
                value: value,
                child: Text(
                  value,
                  // style: smallTextStyle
                ),
              );
            }).toList(),

            // ! DROP DOWN MENU Dname

            hint: Text(
              widget.currentItem == null
                  ? widget.pageName.toString()
                  : widget.dName.toString(),
              // style: smallTextStyle,
            ),
            decoration: InputDecoration(
                counter: Offstage(),
                // labelStyle: labelTextStyle,
                contentPadding: EdgeInsets.symmetric(
                    vertical: widget.vertical != null ? widget.vertical! : 5.0,
                    horizontal: widget.horizontal ?? 10.0),
                isDense: true,
                // focusedBorder: UnderlineInputBorder(
                //   borderSide: BorderSide(color: Colors.red, width: 1.0),
                // ),
                // enabledBorder: UnderlineInputBorder(
                //   borderSide: BorderSide(color: Colors.grey, width: 1.0),
                // ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.2),
                ),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                focusColor: Colors.black,
                hoverColor: Colors.black,
                suffixIconConstraints:
                    BoxConstraints.tightFor(width: 35.0, height: 12.0))),
      ],
    );
  }
}

// ! Search Box
class SearchBox extends StatelessWidget {
  final TextEditingController? controller;
  final BoxDecoration? decoration;

  final String? hintText;

  final Function(String)? onChanged;
  final dynamic onTap;

  final dynamic onPressed;
  final Function(String?)? onSaved;

  final Widget? suffixIcon;
  final Function? validator;

  const SearchBox(
      {Key? key,
      this.controller,
      this.decoration,
      this.hintText,
      this.onChanged,
      this.onPressed,
      this.onSaved,
      this.onTap,
      this.suffixIcon,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(controller!.text);
    return Container(
      child: FormFields(
          hintText: 'Search Something',
          vertical: 15.0,
          controller: controller,
          onChanged: (val) {
            print(val);
            print(controller!.text);
          },
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: controller!.text.isNotEmpty
                ? Icon(Icons.cancel)
                : Icon(Icons.search),
          )),
    );
  }
}
