import 'package:firebase_auth/firebase_auth.dart';
import 'package:modak/dto/ModakUser.dart';

class UserRepository {
  final FirebaseAuth auth;

  UserRepository({required this.auth});

  Future<Map<String, dynamic>?> login(String email, String password) async {
    final userCredential = auth.signInWithEmailAndPassword(
        email: email, password: password);

    return userCredential.then((value) => ModakUser(uid: value.user!.uid, email: value.user!.email!, image: "", level: 1).toJson());
  }

  Future<User?> signUp(String email, String password) async {
    return auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
      return value.user;
    });
  }

  Future logout() async {
    auth.signOut();
  }

  String? getUserToken() {
    if (auth.currentUser != null) {
      return auth.currentUser!.uid;
    } else {
      return null;
    }
  }

  String? getUserEmail() {
    if (auth.currentUser != null) {
      return auth.currentUser!.email;
    } else {
      return null;
    }
  }
}
