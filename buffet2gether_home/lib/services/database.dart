import 'package:cloud_firestore/cloud_firestore.dart';

/*
class DatabaseService {

  final CollectionReference restaurantCollectrion = Firestore.instance.collection('restaurants');

}
*/

class SearchService{

  seacrhByName(String searchField){
    return Firestore.instance.collection('restaurants')
    .where('searchKey', isEqualTo: searchField.substring(0,1).toUpperCase())
    .getDocuments();
  }

}