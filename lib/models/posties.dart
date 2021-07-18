
import 'package:flutter/cupertino.dart';
import 'package:login_facebooke/models/users.dart';

class Posties {
  final User user ;
  final String imagesUrl ;
  final String caption ;
  final String timeAge ;
  final int likes ;
  final int comments ;
  final int shares ;

  Posties({
    @required this.user,
    @required this.imagesUrl,
    @required this.caption,
    @required
    @required this.timeAge, this.likes,
    @required this.comments,
    @required this.shares
  });
}