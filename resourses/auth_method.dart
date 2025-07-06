import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quit/models/user.dart' as model;

class AuthMethod {
  // we can call munlitpe function on it
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return model.User.fromSnap(snap);
  }

  // sign up user

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,

    //required Uint8List file,
  }) async {
    String res = " some error occured ";
    try {
      // if not put any info then no register at firebase
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          bio.isNotEmpty) {
        // register the user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        model.User user = model.User(
          username: username,
          email: email,
          uid: cred.user!.uid,
          photoUrl: '', // or your uploaded URL
          bio: bio,
          follower: [],
          following: [],
        );
        _firestore.collection("user").doc(cred.user!.uid).set(user.toJson());

        res = ('success');
      }
      //add user to our database
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid -email') {
        res = 'THe email is badly formateed .';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured ";
    try {
      if (email.isEmpty || password.isEmpty) {
        _auth.signInWithEmailAndPassword(email: email, password: password);
        res = "Please enter vaild";
      } else {
        res = "Sucesses";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
