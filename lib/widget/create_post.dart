import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_facebooke/models/models.dart';
import 'package:login_facebooke/widget/widget.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({
    Key key,
    @required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 10, 12, 0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
               Profile(imageUrl: currentUser.imageUri),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration.collapsed(
                        hintText: "what's on your mind ? "),
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 5,
            thickness: 2,
          ),
          Container(
            margin: EdgeInsets.all(5),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton.icon(
                    onPressed: () => print("Live"),
                    icon: Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                    label: Text("Live")),
                VerticalDivider(
                  width: 10,
                ),
                FlatButton.icon(
                    onPressed: () => print("Photo"),
                    icon: Icon(
                      Icons.photo_library,
                      color: Colors.green,
                    ),
                    label: Text("Photo")),
                VerticalDivider(
                  width: 10,
                ),
                FlatButton.icon(
                    onPressed: () => print("Room"),
                    icon: Icon(
                      Icons.video_call,
                      color: Colors.purpleAccent,
                    ),
                    label: Text("Room")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
