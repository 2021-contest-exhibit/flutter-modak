
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modak/dto/Chat.dart';
import 'package:modak/dto/Matching.dart';
import 'package:modak/dto/ModakUser.dart';
import 'package:modak/rest/ResponseGetCampings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final repo = FireStoreRepository(store: FirebaseFirestore.instance);
  // await repo.appendChatting("lHKC9XN6suYCNxQzFjJf", "test", "test");
  // await repo.appendChatting("lHKC9XN6suYCNxQzFjJf", "test", "test2");
  // await repo.appendChatting("lHKC9XN6suYCNxQzFjJf", "test", "test3");
  // await repo.appendChatting("lHKC9XN6suYCNxQzFjJf2", "test", "test4");
  // await repo.appendChatting("lHKC9XN6suYCNxQzFjJf2", "test", "test5");
  // await repo.appendChatting("lHKC9XN6suYCNxQzFjJf2", "test", "test6");
  List<Chat> chattings = await repo.getChatting("lHKC9XN6suYCNxQzFjJf");
  print("size: ${chattings.length}");
  print("message: ${chattings[0].message}");
  print(chattings);
  for(int i=0; i< chattings.length; i++) {
    print(chattings[i]);
  }
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(),
    ),
  ));
}

class FireStoreRepository {
  final FirebaseFirestore store;

  FireStoreRepository({required this.store});

  Future<String?> saveMatching(Matching matching) {
    CollectionReference matchings = store.collection("matchings");
    
    return matchings.add(matching.toJson()).then((value) => value.id);
  }

  Future<String?> appendChatting(String matchingId, String uid, String message) {
    CollectionReference chattings = store.collection("chattings");
    return chattings.add(Chat(userId: uid, matchingId: matchingId, message: message, createDate: DateTime.now()).toJson()).then((value) => "chat appended");
  }

  Future<List<Chat>> getChatting(String matchingId) {
    CollectionReference chattings = store.collection("chattings");

    return chattings.where("matchingId", isEqualTo: matchingId).limit(10).get().then((value) {
      return value.docs.map((e) {
        print(Chat.fromJson(e.data() as Map<String, dynamic>).message);
        return Chat.fromJson(e.data() as Map<String, dynamic>);
      }).toList();
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

  Future<List<Map<String, Matching>>?> loadMyMatching(String uid) {
    CollectionReference matchings = store.collection("matchings");
    return matchings.where("user", isEqualTo: uid).get().then((value) async {
      return value.docs.map((e) => {
        e.id: Matching.fromJson(e.data() as Map<String, dynamic>)
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