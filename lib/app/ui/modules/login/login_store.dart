import 'package:flutter_triple/flutter_triple.dart';

class LoginStore extends NotifierStore<Exception, bool> {
  LoginStore() : super(false);

  Future<void> signInWithEmail(String email, String password) async {
    execute(() async {
      int n = 10;
      var result = n ~/ 0;
      return Future.value(result > 0);
    });

    // setLoading(true);
    // try {
    //   int n = 10;
    //   var result = n ~/ 0;
    //   update(result > 0);
    // } on Exception catch (e) {
    //   setError(e);
    // } finally {
    //   setLoading(false);
    // }
  }
}
