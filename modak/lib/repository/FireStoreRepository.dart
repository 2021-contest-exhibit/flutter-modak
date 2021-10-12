
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modak/dto/Matching.dart';
import 'package:modak/rest/ResponseGetCampings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final repo = FireStoreRepository(store: FirebaseFirestore.instance);
  repo.saveMatching(Matching(user: "11", campingId: 1, startDate: DateTime.now(), endDate: DateTime.now()..add(Duration(days: 1)), createDate: DateTime.now()));
  List<Matching>? response = await repo.loadMatching();
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

  Future<List<Matching>?> loadMatching() {
    CollectionReference matchings = store.collection("matchings");
    return matchings.orderBy("createDate", descending: true).limit(10).get().then((value) async {
      return value.docs.map((e) => Matching.fromJson(e.data() as Map<String, dynamic>)).toList();
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

}