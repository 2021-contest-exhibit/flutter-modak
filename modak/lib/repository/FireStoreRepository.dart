
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modak/dto/Matching.dart';
import 'package:modak/dto/ModakUser.dart';
import 'package:modak/rest/ResponseGetCampings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final repo = FireStoreRepository(store: FirebaseFirestore.instance);
  List<Matching>? response = await repo.loadJoinMatchings();
  for (var r in response!) {
    print((r).toJson());
  }
}

class FireStoreRepository {
  final FirebaseFirestore store;

  FireStoreRepository({required this.store});

  Future<String?> saveMatching(Matching matching) {
    CollectionReference matchings = store.collection("matchings");
    
    return matchings.add(matching.toJson()).then((value) {
      return "matching saved";
    });
  }

  Future<List<Map<String, Matching>>?> loadMatching() {
    CollectionReference matchings = store.collection("matchings");
    return matchings.orderBy("createDate", descending: true).limit(10).get().then((value) async {
      return value.docs.map((e) => {
        e.id: Matching.fromJson(e.data() as Map<String, dynamic>)
      }).toList();
    });
  }

  Future<List<Matching>?> loadMyMatching(String uid) {
    CollectionReference matchings = store.collection("matchings");
    return matchings.where("user", isEqualTo: uid).orderBy("createDate", descending: true).get().then((value) async {
      return value.docs.map((e) {
        return Matching.fromJson(e.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Future signUpUser(ModakUser user) async {
    CollectionReference users = store.collection("users");
    return users.add(user.toJson());
  }

  Future<ModakUser?> loadUser(String uid) async {
    CollectionReference users = store.collection("users");
    return users.where("uid", isEqualTo: uid).get().then((value) {
      if (value.size > 0){
        return ModakUser.fromJson(value.docs[0].data() as Map<String, dynamic>);
      } else {
        return null;
      }
    });
  }

  Future<List<Matching>?> loadJoinMatchings() async {
    CollectionReference matchings = store.collection("matchings");
    return matchings.where("userList", arrayContains: "Tg0dduxXYPeD9ZSat8LEbBaqOw53").get().then((value) async {
      return value.docs.map((e) {
        return Matching.fromJson(e.data() as Map<String, dynamic>);
      }).toList();
    });
  }

}