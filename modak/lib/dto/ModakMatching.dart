

import 'package:modak/dto/Matching.dart';
import 'package:modak/dto/ModakUser.dart';
import 'package:modak/rest/Content.dart';

class ModakMatching {
  Matching? matching;
  Content? content;
  String? uid;
  String? email;
  ModakUser? user;
  String? matchingId;

  ModakMatching({this.matching, this.content, this.uid, this.email, this.matchingId, this.user});
}