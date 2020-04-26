import 'package:buffet2gether_home/models/profile_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:buffet2gether_home/models/bar_model.dart';
import 'package:buffet2gether_home/models/infoInGroup_model.dart';
import 'package:buffet2gether_home/models/memberBarListInGroup_model.dart';
import 'package:buffet2gether_home/models/infoInTable_model.dart';
import 'package:buffet2gether_home/models/memberBarListInTable_model.dart';
import 'package:buffet2gether_home/models/rec_model.dart';
import 'package:buffet2gether_home/models/more_model.dart';

class DatabaseService
{
  final String uid;
  final String numberGroup;
  final String numberTable;
  final String resID;
  DatabaseService({ this.uid,this.numberGroup,this.numberTable,this.resID });


  //----------------------------- Restaurants -----------------------------------------------------------
  final CollectionReference recInResCollection = Firestore.instance.collection('Restaurants/recommend/recList');
  final CollectionReference moreInResCollection = Firestore.instance.collection('Restaurants/more/moreList');
  final CollectionReference GroupsCollection = Firestore.instance.collection('Groups');

  ///ดึงข้อมูลร้านใน Recommend
  List<Recom> _recListFromSnapshot(QuerySnapshot snapshot)
  {
    return snapshot.documents.map((doc)
    {
      return Recom(
        resID: doc.data['resID']??'',
        imageUrl: doc.data['imageUrl']??'',
        name1: doc.data['name1']??'',
        name2: doc.data['name2']??'',
        location: doc.data['location']??'',
        promotion: doc.data['promotion']??'',
        promotionInfo: doc.data['promotionInfo']??'',
        time: doc.data['time']??'',
      );
    }).toList();
  }
  Stream<List<Recom>>get recInRes
  {
    return recInResCollection.snapshots().map(_recListFromSnapshot);
  }

  ///ดึงข้อมูลร้านใน More
  List<More> _moreListFromSnapshot(QuerySnapshot snapshot)
  {
    return snapshot.documents.map((doc)
    {
      return More(
        resID: doc.data['resID']??'',
        imageUrl: doc.data['imageUrl']??'',
        name1: doc.data['name1']??'',
        name2: doc.data['name2']??'',
        location: doc.data['location']??'',
        promotion: doc.data['promotion']??'',
        promotionInfo: doc.data['promotionInfo']??'',
        time: doc.data['time']??'',
      );
    }).toList();
  }
  Stream<List<More>>get moreInRes
  {
    return moreInResCollection.snapshots().map(_moreListFromSnapshot);
  }

  ///เพิ่มข้อมูลกลุ่มที่สร้างใน Groups/ชื่อร้าน(resID)/GroupsInRes/... ใน 1 ร้านมีหลายกลุ่ม
  Future updateGroups(
      String resID,
      String name1,
      String name2,
      String image,
      String location,
      String time,
      int ageStart,
      int ageEnd,
      double num,
      DateTime dueTime,
      String gender,
      bool fashion,
      bool sports,
      bool technology,
      bool politics,
      bool entertainment,
      bool books,
      bool pet,
      String numberTable
      ) async
  {
    return await GroupsCollection.document(resID).collection('GroupsInRes').document(numberTable).collection('info').document().setData({
      'resID' : resID,                  /// ข้อมูลร้าน
      'name1' : name1,
      'name2' : name2,
      'image': image,
      'location': location,
      'time': time,
      'ageStart': ageStart,             /// คุณสมบัติ
      'ageEnd': ageEnd,
      'num' : num,
      'dueTime' : dueTime,
      'gender' : gender,
      'fashion' : fashion,              /// ความชอบของกลุ่ม
      'sports' : sports,
      'technology' : technology,
      'politics' : politics,
      'entertainment' : entertainment,
      'books' : books,
      'pet' : pet,

    });
  }

  ///เพิ่มข้อมูลคนหากลุ่มใน Groups/ชื่อร้าน(resID)/UserFindGroup/... ใน 1 ร้านมีคนหากลุ่มมหลายคน
  Future updateUserFindGroup(String resID, String name1, String name2, String image, String location, String time,
      String userName,String profilePic, String gender, int age,bool fashion, bool sports, bool technology, bool politics, bool entertainment, bool books, bool pet,) async{
    return await GroupsCollection.document(resID).collection('UserFindGroup').document(uid).setData({
      'resID' : resID,                  /// ข้อมูลร้าน
      'name1' : name1,
      'name2' : name2,
      'image': image,
      'location': location,
      'time': time,
      'userName' : userName,            /// ข้อมูล user
      'profilePic' : profilePic,
      'gender' : gender,
      'age' : age,
      'fashion' : fashion,              /// ความชอบของ user
      'sports' : sports,
      'technology' : technology,
      'politics' : politics,
      'entertainment' : entertainment,
      'books' : books,
      'pet' : pet,
    });
  }

  //----------------------------- NOTIFACATION -----------------------------------------------------------
  /// set path ของ Collection ใน firebase ที่จะเอามาใช้
  final CollectionReference notificationCollection = Firestore.instance.collection('Notification');
  final CollectionReference memberInGroupCollection = Firestore.instance.collection('Groups');
  final CollectionReference infoInGroupCollection = Firestore.instance.collection('Groups');

  /// ฟังก์ชันเอาไว้เพิ่ม document ใน firebase ส่วนที่เป็น notification (เพิ่มแถบแจ้งเตือน)
  Future updateNotifData(
      String imageUrl,
      String membername,
      String number,
      bool group,
      String gender,
      int age,
      bool fashion,
      bool sport,
      bool technology,
      bool political,
      bool entertainment,
      bool book,
      bool pet,
      ) async{
    return await notificationCollection.document(uid).setData({
      'imageUrl': imageUrl,      ///รูปโปรไฟล์ user (ถ้าเป็น groupbar จะเป็นของหัวหน้ากลุ่ม)
      'membername': membername,  ///ชื่อ user (ถ้าเป็น groupbar จะเป็นของหัวหน้ากลุ่ม)
      'number': number,          ///นำไปใช้เฉพาะ groupbar เป็นเลขของกลุ่ม
      'group' : group,
      'gender': gender,
      'age': age,
      'fashion': fashion,
      'sport': sport,
      'technology': technology,
      'political': political,
      'entertainment': entertainment,
      'book' : book,
      'pet': pet,       ///นำไปใช้เฉพาะ groupbar เป็น true
    });
  }

  /// ฟังก์ชันเอาไว้เพิ่ม document ใน firebase ส่วนที่รับ member เข้ากลุ่ม
  Future updateMemberInGroup(
      String resID,
      String imageUrl,
      String membername,
      String numberTable,
      String gender,
      int age,
      bool fashion,
      bool sport,
      bool technology,
      bool political,
      bool entertainment,
      bool book,
      bool pet,
      String statusMember
      ) async{
    return await GroupsCollection.document(resID).collection('GroupsInRes').document(numberTable).collection('member').document(statusMember).setData({
      'imageUrl': imageUrl,
      'membername':membername,
      'gender': gender,
      'age': age,
      'fashion': fashion,
      'sport': sport,
      'technology': technology,
      'political': political,
      'entertainment': entertainment,
      'book' : book,
      'pet': pet, ///เก็บเลขของกลุ่มไว้ว่าเราอยู่ในโต๊ะหมายเลขนี้
    });
  }

  void deleteNotifData(String documentID){
    notificationCollection.document(documentID).delete();
  }

  /// map แถบการแจ้งเตือนจาก document ใน Notification ทั้ง 2 แบบ ให้อยู่ใน list เดียวกัน
  List<Bar> _notificationListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      if(doc.data['group']??false){   ///ถ้า group เป็น true จะสร้าง group bar
        return CreateGroupBar(
            imageUrl: doc.data['imageUrl']??'',
            membername: doc.data['membername']??'',
            number: doc.data['number']??'',
            gender: doc.data['gender']??'',
            age: doc.data['age']??0,
            fashion:doc.data['fashion']??false,
            sport:doc.data['sport']??false,
            technology:doc.data['technology']??false,
            political:doc.data['political']??false,
            entertainment:doc.data['entertainment']??false,
            book:doc.data['book']??false,
            pet:doc.data['pet']??false,
            id: doc.documentID,
            resID: doc.data['resID']??''
        );
      }else{                        ///ถ้า group เป็น false จะสร้าง notif bar
        return CreateNotifBar(
            imageUrl: doc.data['imageUrl']??'',
            membername: doc.data['membername']??'',
            gender: doc.data['gender']??'',
            age: doc.data['age']??0,
            fashion:doc.data['fashion']??false,
            sport:doc.data['sport']??false,
            technology:doc.data['technology']??false,
            political:doc.data['political']??false,
            entertainment:doc.data['entertainment']??false,
            book:doc.data['book']??false,
            pet:doc.data['pet']??false,
            id: doc.documentID
        );
      }
    }).toList();
  }
  Stream<List<Bar>>get notifications{
    return notificationCollection.snapshots()
        .map(_notificationListFromSnapshot);
  }

  /// map สมาชิกที่อยู่ในโต๊ะ ในหน้า Table
  List<MemberBarListInTable> _memberInTableFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return MemberBarListInTable(
        imageUrl: doc.data['imageUrl']??'',
        membername: doc.data['membername']??'',
        gender: doc.data['gender']??'',
        age: doc.data['age']??0,
        fashion:doc.data['fashion']??false,
        sport:doc.data['sport']??false,
        technology:doc.data['technology']??false,
        political:doc.data['political']??false,
        entertainment:doc.data['entertainment']??false,
        book:doc.data['book']??false,
        pet:doc.data['pet']??false,
      );

    }).toList();
  }
  Stream<List<MemberBarListInTable>>get memberInTable{
    return memberInGroupCollection.document(resID).collection('GroupsInRes').document(numberTable).collection('member').snapshots()
        .map(_memberInTableFromSnapshot);
  }
  /// map ข้อมูลรายละเอียดร้านอาหาร ในหน้า Table
  List<InfoInTable> _infoInTableFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return InfoInTable(
        number: numberTable,
        name: doc.data['name2']??'',
        location: doc.data['location']??'',
        time: doc.data['time']??'',
        imageUrl: doc.data['image']??'',
        ageStart: doc.data['ageStart']??0,
        ageEnd: doc.data['ageEnd']??0,
        people: doc.data['num']??0.0,
        dueTime: doc.data['dueTime'].toString(),
        gender:doc.data['gender']??'',
      );
    }).toList();
  }
  Stream<List<InfoInTable>>get infoInTable{
    return infoInGroupCollection.document(resID).collection('GroupsInRes').document(numberTable).collection('info').snapshots()
        .map(_infoInTableFromSnapshot);
  }
  /// map สมาชิกที่อยู่ในโต๊ะ ในแถบรายละเอียดกลุ่มเมื่อกดแถบ group bar
  List<MemberBarListInGroup> _memberInGroupFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return MemberBarListInGroup(
        imageUrl: doc.data['imageUrl']??'',
        membername: doc.data['membername']??'',
        gender: doc.data['gender']??'',
        age: doc.data['age']??0,
        fashion:doc.data['fashion']??false,
        sport:doc.data['sport']??false,
        technology:doc.data['technology']??false,
        political:doc.data['political']??false,
        entertainment:doc.data['entertainment']??false,
        book:doc.data['book']??false,
        pet:doc.data['pet']??false,
      );
    }).toList();
  }
  Stream<List<MemberBarListInGroup>>get memberInGroup{
    // final CollectionReference memberInGroupCollection = Firestore.instance.collection('InviteToGroup/456/$numberGroup');
    return memberInGroupCollection.document(resID).collection('GroupsInRes').document(numberGroup).collection('member').snapshots()
        .map(_memberInGroupFromSnapshot);
  }
  /// map ข้อมูลรายละเอียดร้านอาหาร ในแถบรายละเอียดกลุ่มเมื่อกดแถบ group bar
  List<InfoInGroup> _infoInGroupFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return InfoInGroup(
        number: numberGroup,
        name: doc.data['name2']??'',
        location: doc.data['location']??'',
        time: doc.data['time']??'',
        imageUrl: doc.data['image']??'',
        ageStart: doc.data['ageStart']??0,
        ageEnd: doc.data['ageEnd']??0,
        people: doc.data['num']??0.0,
        dueTime: doc.data['dueTime'].toString(),
        gender:doc.data['gender']??'',
      );
    }).toList();
  }
  Stream<List<InfoInGroup>>get infoInGroup{
    return infoInGroupCollection.document(resID).collection('GroupsInRes').document(numberGroup).collection('info').snapshots()
        .map(_infoInGroupFromSnapshot);
  }

  //------------------------------- USER -----------------------------------------------------------
// collection reference
  final CollectionReference userCollection = Firestore.instance.collection('Users');
  final CollectionReference tableCollection = Firestore.instance.collection('Groups');

  Future<void> updateUserData(
      String profilePicture,
      String name,
      String gender,
      DateTime dateOfBirth,
      String bio,
      bool fashion,
      bool sport,
      bool technology,
      bool politic,
      bool entertainment,
      bool book,
      bool pet,
      bool isOwner) async
  {
    return await userCollection.document(uid).setData({
      'ProfilePicture': profilePicture,
      'Name': name,
      'Gender': gender,
      'BirthDate': dateOfBirth,
      'Bio': bio,
      'Fashion': fashion,
      'Sport': sport,
      'Technology': technology,
      'Politic': politic,
      'Entertainment': entertainment,
      'Book': book,
      'Pet': pet,
      'isOwner': isOwner,
      'UserID': userCollection.document(uid).documentID,
    });
  }

  Future<void> updateUserDataInteresting(
      bool fashion,
      bool sport,
      bool technology,
      bool politic,
      bool entertainment,
      bool book,
      bool pet,
      ) async {
    return await userCollection.document(uid).updateData({
      'Fashion': fashion,
      'Sport': sport,
      'Technology': technology,
      'Politic': politic,
      'Entertainment': entertainment,
      'Book': book,
      'Pet': pet,
    });
  }

  Future<void> updateUserDataDetail(
      String name,
      String gender,
      DateTime dateOfBirth,
      String bio,
      ) async {
    return await userCollection.document(uid).updateData({
      'Name': name,
      'Gender': gender,
      'BirthDate': dateOfBirth,
      'Bio': bio,
    });
  }

  Future<void> updateUserProfilePicture(
      String url,
      ) async {
    return await userCollection.document(uid).updateData({
      'ProfilePicture': url,
    });
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      userId: uid,
      profilePicture: snapshot.data['ProfilePicture'],
      name: snapshot.data['Name'],
      gender: snapshot.data['Gender'],
      dateofBirth: snapshot.data['BirthDate'].toDate(),
      bio: snapshot.data['Bio'],
      fashion: snapshot.data['Fashion'],
      sport: snapshot.data['Sport'],
      technology: snapshot.data['Technology'],
      politic: snapshot.data['Politic'],
      entertainment: snapshot.data['Entertainment'],
      book: snapshot.data['Book'],
      pet: snapshot.data['Pet'],
      isOwner: snapshot.data['isOwner'],
    );
  }

  // get brews stream
  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

  // user list from snapshot
  /*List<UserInformation> _userListFromSnapshot(QuerySnapshot snapshot)
  {
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
  Stream<List<UserInformation>> get users
  {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }*/

  Future<void> creatTable(String master,String member1,String member2,String member3) async
  {
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
