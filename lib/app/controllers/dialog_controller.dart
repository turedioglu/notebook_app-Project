import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/init/network/network_manager.dart';

class DialogController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String? detailTitle;

  String? detailContent;

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  noteUpdate({
    required String id,
  }) async {
    await NetworkManager.instance.notesCollection.doc(id).update({
      'title': titleController.text,
      'content': descriptionController.text,
    });
    detailTitle = titleController.text;
    detailContent = descriptionController.text;
    update();
  }

  addNote() {
    NetworkManager.instance.notesCollection.add({
      'title': titleController.text,
      'content': descriptionController.text,
    });
  }
}
