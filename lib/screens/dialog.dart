import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final String data;
  DialogBox({this.data});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      backgroundColor: Colors.transparent,
      child: Container(
        height: 100,
        margin: EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 5,
            ),
            CircularProgressIndicator(),
            SizedBox(
              width: 25,
            ),
            Text(
              data,
              style: TextStyle(fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
  }
}
