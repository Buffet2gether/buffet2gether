import 'package:firebase_auth/firebase_auth.dart';
import 'package:buffet2gether_home/services/database.dart';
import 'package:buffet2gether_home/models/user.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //creat user obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

//auth change user stream
Stream<User> get user {
  return _auth.onAuthStateChanged
    .map(_userFromFirebaseUser);
}



//sign in with email-password

Future signInWithEmailAndPassword(String email, String password) async {
  try {
    print(email);
    print(password);
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return _userFromFirebaseUser(user);
  } catch (e) {
    print(e.toString());
    return null;
  }

}



//register 
Future registerWithEmailAndPassword(String email, String password, String username ,  String gender ,DateTime dateOfBirth ) async {
  try {
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    //creat a new doc for the user with uid
    await DatabaseService(uid: user.uid).updateUserData(username,gender,dateOfBirth,false,false,false,false,false,false);
    return _userFromFirebaseUser(user);
  } catch (e) {
    print(e.toString());
    return null;
  }
}



//sign out
Future signOut() async{
  try{
    return await _auth.signOut();
  }catch(e){
    print(e.toString());
    return null;
  }

}


}