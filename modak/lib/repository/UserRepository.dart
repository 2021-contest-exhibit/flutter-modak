import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth auth;

  UserRepository({required this.auth});

  Future<Map<String, dynamic>> selectUser() async {
    final userCredential = auth.signInWithEmailAndPassword(
        email: 'test@test.com', password: 'test123');

    return userCredential.then((value) => {'userid': value.user!.email, 'level': 4});

    // return {
    //   'userid': 'ysy3350',
    // };
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final userCredential = auth.signInWithEmailAndPassword(
        email: email, password: password);

    return userCredential.then((value) => {'userid': value.user!.email, 'level': 4});
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
}
