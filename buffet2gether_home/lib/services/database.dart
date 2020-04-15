import 'package:buffet2gether_home/models/userInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference userCollection = Firestore.instance.collection('Users');
  
  final CollectionReference tableCollection = Firestore.instance.collection('Groups');
 

  Future<void> updateUserData(String name, String gender,DateTime dateOfBirth, bool sport,bool pet,bool technology,bool political,bool beauty,bool entertainment) async {
    return await userCollection.document(uid).setData({
      'Name': name,
      'BirthDate' : dateOfBirth,
      'Gender': gender,
      'Sport' : sport,
      'Pet' : pet,
      'Technology' :  technology,
      'Political' : political,
      'Beauty' : beauty,
      'Entertainment' : entertainment,
      'UserID' : userCollection.document(uid).documentID,
    });
  }

  // user list from snapshot
  List<UserInformation> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return UserInformation(
        name: doc.data['Name'] ?? '',
        gender: doc.data['Gender'] ?? '',
        userID : doc.data['UserID'] ?? '',
        sport: doc.data['Sport'] ?? '',
        pet: doc.data['Pet'] ?? '',
        technology: doc.data['Technology'] ?? '',
        political: doc.data['Polotical'] ?? '',
        beauty: doc.data['Beauty'] ?? '',
        entertainment: doc.data['Entertainment'] ?? ''
      );
    }).toList();
  }

  // get brews stream
  Stream<List<UserInformation>> get users {
    return userCollection.snapshots()
      .map(_userListFromSnapshot);
  }


  Future<void> creatTable(String master,String member1,String member2,String member3) async{
        return await userCollection.document(uid).setData({
          'Master' : userCollection.document(uid).documentID,
          'Member1' : member1,
          'Member2' : member2,
          'Member3' : member3,
        });
  }

/*
  List<GetID> _GetID(QuerySnapshot snapshot){

    
  }

*/

}
