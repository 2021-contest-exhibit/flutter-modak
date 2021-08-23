
class UserRepository {

  Future<Map<String, dynamic>> selectUser() async {
    await Future.delayed(Duration(seconds: 1 ));
    return {
      'userid': 'ysy3350',
    };
  }

}