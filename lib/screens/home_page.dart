import 'package:flutter/material.dart';
import 'package:login_facebooke/data/data.dart';
import 'package:login_facebooke/models/models.dart';
import 'package:login_facebooke/widget/widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              "facebook",
              style: TextStyle(
                color: Colors.blue[600],
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.0,
              ),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              ButtonHomePage(
                icon: Icons.search,
                iconSize: 30,
                onPressed: () => print("Search"),
              ),
              ButtonHomePage(
                icon: Icons.messenger,
                iconSize: 30,
                onPressed: () => print("Messenger"),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePostContainer(currentUser: currentUser),
          ),
          SliverPadding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
              sliver: SliverToBoxAdapter(
                child: Rooms(onlineUser: onlineUser),
              )),
          SliverPadding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              sliver: SliverToBoxAdapter(
                  child: Stories(currentUser: currentUser, stories: storyies))
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context, index){
         final Posties post = posties [index];
         return PostContainer(posties:post);
          },
          childCount: posties.length,
          ))
        ],
      ),
    );
  }
}
