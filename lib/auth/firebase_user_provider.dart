import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ReviewRequester2FirebaseUser {
  ReviewRequester2FirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

ReviewRequester2FirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ReviewRequester2FirebaseUser> reviewRequester2FirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ReviewRequester2FirebaseUser>(
            (user) => currentUser = ReviewRequester2FirebaseUser(user));
