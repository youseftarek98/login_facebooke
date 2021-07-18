import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_facebooke/models/models.dart';
import 'package:login_facebooke/widget/profile.dart';

class PostContainer extends StatelessWidget {
  final Posties posties;

  const PostContainer({Key key, @required this.posties}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(posties: posties),
                SizedBox(
                  height: 5,
                ),
                Text(posties.caption),
                posties.imagesUrl != null
                    ? SizedBox.shrink()
                    : SizedBox(
                        height: 5,
                      )
              ],
            ),
          ),
          posties.imagesUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 9),
                  child: CachedNetworkImage(imageUrl: posties.imagesUrl),
                )
              : SizedBox.shrink(),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10),
          child: _PostStats(posties:posties),)
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Posties posties;

  const _PostHeader({Key key, @required this.posties}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Profile(imageUrl: posties.user.imageUri),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                posties.user.name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    "${posties.timeAge} -",
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12,
                  )
                ],
              ),
            ],
          ),
        ),
        IconButton(icon: Icon(Icons.more_horiz), onPressed: () => print("more"))
      ],
    );
  }
}



class _PostStats extends StatelessWidget {
  final Posties posties;
  const _PostStats({
    Key key,
  @required this.posties
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row( children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(color: Colors.blueAccent , shape: BoxShape.circle),
          child: Icon(Icons.thumb_up , size: 10 , color: Colors.white,),
          ),
          SizedBox(width: 5,),
          Expanded(child: Text("${posties.likes} ", style: TextStyle(color: Colors.grey[600]),)),
          SizedBox(width: 5,),
          Text("${posties.comments} Comments", style: TextStyle(color: Colors.grey[600]),),
          SizedBox(width: 5,),
          Text("${posties.shares} Shares", style: TextStyle(color: Colors.grey[600]),),
        ],),
        Divider(),
        Row(children: [
          _PostButton(
            icon:Icon(Icons.thumb_up,
            color: Colors.grey[600],
              size: 20,
            ),
            label:"Like",
            onTap: () =>print("Like"),
          ),
          _PostButton(
            icon:Icon(Icons.mode_comment_outlined,
              color: Colors.grey[600],
              size: 20,
            ),
            label:"Comment",
            onTap: () =>print("Comment"),
          ),_PostButton(
            icon:Icon(Icons.share,
              color: Colors.grey[600],
              size: 20,
            ),
            label:"Share",
            onTap: () =>print("Share"),
          ),
        ],)
      ],
    );
  }
}


class _PostButton extends StatelessWidget {
  final Icon icon ;
  final String label;
  final Function onTap;
  const _PostButton({
    Key key,
  @required this.icon,
  @required this.label,
  @required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              icon,
              SizedBox(width: 5,),
              Text(label),
            ],),
          ),
        ),
      ),
    );
  }
}
