import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowDialog extends StatelessWidget {
  final String text;
  final String yesBtn;
  final String noBtn;
  final String imgPath;
  final Function onPressed;
  final Function onPress;
  const ShowDialog({
    Key key,
    this.text,
    this.imgPath,
    this.yesBtn,
    this.noBtn,
    this.onPressed,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(18.0),
        ),
      ),
      title: Text(text, textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.deepOrangeAccent,
                fontSize: 30,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold),
          ),
      content: Image.asset(
        imgPath,
        width: 400,
      ),
      actions: <Widget>[
        TextButton(
          
          onPressed: () {
            onPressed();
          }, child: null,
    //  child: Text("NO"),
        ),
        TextButton(
          onPressed: () {
            onPress();
            //Navigator.of(context).pop();
          },
          child: Text(
            yesBtn,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.deepOrangeAccent,
                fontSize: 20,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
