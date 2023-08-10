import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notebook_app/app/controllers/dialog_controller.dart';
import '../../../../data/utils/validators/validator_manager.dart';
import '../../../global_widgets/general_dialog.dart';

class HomeDialogs {
  void addNoteDialog({required BuildContext context}) {
    NoteApp().showGeneralDialog(
      context,
      body: GetBuilder<DialogController>(
        init: DialogController(),
        builder: (c) {
          return Form(
            key: c.formKey,
            child: Column(
              children: [
                const Text(
                  "Not Ekle",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Başlık Girin"),
                  maxLines: 2,
                  validator: ValidatorManager.defaultEmptyCheckValidator,
                  controller: c.titleController,
                ),
                TextFormField(
                  maxLines: 4,
                  decoration: const InputDecoration(hintText: "İçerik Girin"),
                  validator: ValidatorManager.defaultEmptyCheckValidator,
                  controller: c.descriptionController,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: MaterialButton(
                    color: Colors.orange,
                    child: const Text("EKLE"),
                    onPressed: () {
                      if (c.formKey.currentState!.validate()) {
                        c.addNote();
                        Get.back();
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
