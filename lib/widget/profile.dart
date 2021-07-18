
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String imageUrl;
  final bool isActive ;
  final bool hasBorder;

 const Profile({
   Key key,
   @required this.imageUrl,
  this.hasBorder=false,
   this.isActive =false,
 }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.blueAccent,
          child: CircleAvatar(
            radius:hasBorder? 15 : 20,
            backgroundColor: Colors.grey[200],
            backgroundImage:
            CachedNetworkImageProvider(imageUrl),
          ),
        ),
        isActive ? Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: Colors.white
              )
            ),
          ),
        )
            : SizedBox.shrink(),
      ],
    );
  }
}
