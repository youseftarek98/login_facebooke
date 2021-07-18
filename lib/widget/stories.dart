
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_facebooke/data/data.dart';
import 'package:login_facebooke/models/models.dart';
import 'package:login_facebooke/widget/widget.dart';

class Stories extends StatelessWidget {
    final User currentUser;
    final List<Storyies> stories ;
  const Stories({
    Key key,
    @required this.currentUser,
    @required this.stories
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.grey,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 1),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + stories.length,
          itemBuilder: (context , index){
          if(index == 0){
            return Padding(padding: EdgeInsets.symmetric(horizontal: 5),
            child: _StoryCard(
              isAddStory:true ,
              currentUser :currentUser ,
            ),
            );
          }
          final Storyies story =stories[index - 1];
            return Padding(padding: EdgeInsets.symmetric(horizontal: 5),
            child:_StoryCard(story :story) ,
            ) ;
          }),
    );

  }
}


class _StoryCard extends StatelessWidget {
  final  bool isAddStory ;
  final User currentUser ;
  final  Storyies story ;
  const _StoryCard({
    Key key,
    this.isAddStory=false,
    @required this.currentUser,
    @required this.story
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: CachedNetworkImage(imageUrl: isAddStory ?currentUser.imageUri :story.imagesUrl,
            width: 100,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(

          height: double.infinity,
          width: 100,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white,),
        ),
        Positioned(child: isAddStory ? Container(
          height: 40,width: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
          color: Colors.white,

        ),
          child: IconButton(
            color: Colors.blueAccent,
              padding: EdgeInsets.zero,
              icon: Icon(Icons.add , ), onPressed: () =>print("add to story") ),
        )
            :Profile(imageUrl: story.user.imageUri,
        hasBorder: !story.viewed,
        ),
        ),
        Positioned(
            bottom: 9,
            left: 9,
            right: 9,
            child: Text(isAddStory ? "add to story" :story.user.name,
            style: TextStyle(color: Colors.blueAccent , fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
        )
      ],
    );
  }
}
