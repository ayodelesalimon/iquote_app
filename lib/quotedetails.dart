import 'package:flut/card.dart';
import 'package:flut/screens/humour_screen.dart';
import 'package:flut/util/category.dart';
import 'package:flutter/material.dart';

class QouteDetails extends StatefulWidget {
  final Category category;

  const QouteDetails({Key key, this.category}) : super(key: key);
  @override
  _QouteDetailsState createState() => _QouteDetailsState();
}

class _QouteDetailsState extends State<QouteDetails> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: widget.category.colors,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: widget.category.colors,
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 16),
                    child: IconButton(
                      icon: Icon(Icons.close),
                      iconSize: 40,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      widget.category.imgPath,
                      height: screenHeight * 0.45,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 8),
                    child: Hero(
                      tag: widget.category.name,
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                    transitionDuration:
                                        Duration(milliseconds: 350),
                                    pageBuilder: (context, _, __) =>
                                        AnimContainer()),
                              );
                            },
                            child: Text(
                              widget.category.name,
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 8),
                    child: Text(
                      "TI don't like the Speedy TI don't like the Speedy cos it tastes too tasty. Expressionless face The exces of wheat in Digestive made it irritate me especially when my friends said the wheat were maggots Face with tears of joy Pepper Snack was OK but Coconut was my fav.Face savouring food There was Stixi too, that one was for drinking koko during TI don't like the Speedy cos it tastes too tasty. Expressionless face The exces of wheat in Digestive made it irritate me especially when my friends said the wheat were maggots Face with tears of joy Pepper Snack was OK but Coconut was my fav.Face savouring food There was Stixi too, that one was for drinking koko during long break.Face with tears of joyTI don't like the Speedy cos it tastes too tasty. Expressionless face The exces of wheat in Digestive made it irritate me especially when my friends said the wheat were maggots Face with tears of joy Pepper Snack was OK but Coconut was my fav.Face savouring food There was Stixi too, that one was for drinking koko during long break.Face with tears of joy long break.Face with tears of joycos it tastes too tasty. Expressionless face The exces of wheat in Digestive made it irritate me especially when my friends said the wheat were maggots Face with tears of joy Pepper Snack was OK but Coconut was my fav.Face savouring food There was Stixi too, that one was for drinking koko during long break.Face with tears of joy",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
