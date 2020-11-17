import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTicketPage extends StatefulWidget {
  final Function(String, String) callback;

  AddTicketPage(this.callback);

  @override
  State createState() => new AddTicketPageState();
}

class AddTicketPageState extends State<AddTicketPage> {
  final TextEditingController title = new TextEditingController(text: "");
  final TextEditingController description = new TextEditingController(text: "");

  @override
  void dispose() {
    super.dispose();
    title.dispose();
    description.dispose();
  }

  void _saveInfo() {
    widget.callback(title.text, description.text);
    title.clear();
    description.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Add Ticket"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new TextField(
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              controller: title,
              decoration: InputDecoration(
                  hintText: "Title", hintStyle: TextStyle(color: Colors.grey)),
            ),
            new TextField(
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              controller: description,
              decoration: InputDecoration(
                  hintText: "Description",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            new RaisedButton.icon(
              onPressed: _saveInfo,
              icon: Icon(Icons.save),
              color: Colors.purpleAccent,
              label: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
