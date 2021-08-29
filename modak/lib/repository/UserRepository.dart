import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth auth;

  UserRepository({required this.auth});

  Future<Map<String, dynamic>> selectUser() async {
    await Future.delayed(Duration(seconds: 1));
    final userCredential = auth.signInWithEmailAndPassword(
        email: 'test@test.com', password: 'test123');

    // return userCredential.then((value) => {'userid': value.user!.email, 'level': 4});
    return userCredential.then((value) => {});

    // return {
    //   'userid': 'ysy3350',
    // };
  }
}
