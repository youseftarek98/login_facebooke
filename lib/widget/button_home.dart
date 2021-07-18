import 'package:flutter/material.dart';

class ButtonHomePage extends StatelessWidget {
  final IconData icon;

  final double iconSize;

  final Function onPressed;

  const ButtonHomePage({
    Key key ,
    @required this.icon,
    @required  this.iconSize,
    @required this.onPressed,
  }
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        decoration:
        BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle),
        child: IconButton(
            icon: Icon(icon),
            color: Colors.black,
            iconSize: iconSize,
            onPressed: onPressed));
  }
}
