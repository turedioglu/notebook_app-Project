import 'package:cloud_firestore/cloud_firestore.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  NetworkManager._init();

  CollectionReference<Map<String, dynamic>> notesCollection = FirebaseFirestore.instance.collection('notes');

  Stream<QuerySnapshot<Map<String, dynamic>>> getNotes = FirebaseFirestore.instance.collection('notes').snapshots();

}
