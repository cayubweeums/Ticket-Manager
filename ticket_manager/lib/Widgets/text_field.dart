import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final Function(String) callback;

  TextFieldWidget(this.callback);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final controllerOne = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controllerOne.dispose();
  }

  void click() {
    widget.callback(controllerOne.text);
    controllerOne.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerOne,
      decoration: InputDecoration(
          suffixIcon: IconButton(
        icon: Icon(Icons.send),
        onPressed: this.click,
        splashColor: Colors.pink,
        tooltip: "Send Ticket",
      )),
    );
  }
}
