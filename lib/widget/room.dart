import 'package:flutter/material.dart';
import 'package:login_facebooke/models/models.dart';
import 'package:login_facebooke/widget/profile.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUser;

  const Rooms({
    Key key,
    @required this.onlineUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUser.length,
        itemBuilder: (context, index) {
          if(index ==0){
            return Padding(padding: EdgeInsets.symmetric(horizontal: 7),
            child:_CreateRoomButton() ,
            );
          }
          final User user =onlineUser[index-1];
          return Padding(padding: EdgeInsets.symmetric(horizontal: 10),
          child: Profile(imageUrl: user.imageUri,isActive: true,),
          );
        },
      ),
    );
  }
}


class _CreateRoomButton extends StatelessWidget {

   _CreateRoomButton({Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(onPressed: () => print("Create Room"),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)
    ),
      color: Colors.white,
      borderSide: BorderSide(width: 4 , color: Colors.blueAccent[100]
      ),
      textColor: Colors.blue,
      child: Row(children: [
             Icon(Icons.video_call , size: 30 , color: Colors.lightBlueAccent,),
        SizedBox(width: 5,),
        Text("Create\nRoom")
      ],),
    );
  }
}
