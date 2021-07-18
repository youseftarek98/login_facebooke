

import 'package:flutter/cupertino.dart';
import 'package:login_facebooke/models/users.dart';

class Storyies{
  final User user ;
  final String imagesUrl ;
  final bool viewed ;

  Storyies({
    @required this.user,
    @required this.imagesUrl,
    this.viewed = false
  });
}