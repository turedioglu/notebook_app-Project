import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/init/network/network_manager.dart';

class HomeController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  deleteAllNotes() async {
    try {
      await NetworkManager.instance.notesCollection.get().then((QuerySnapshot querySnapshot) async {
        for (var documentSnapshot in querySnapshot.docs) {
          await NetworkManager.instance.notesCollection.doc(documentSnapshot.id).delete();
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
