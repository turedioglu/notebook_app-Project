import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/dialog_controller.dart';
import '../../../../data/utils/validators/validator_manager.dart';
import '../../../global_widgets/general_dialog.dart';

class NoteDetailDialogs {
  void updateDialogs({required BuildContext context, required String title, required String detail, required String id}) {
    NoteApp().showGeneralDialog(context,
        body: GetBuilder<DialogController>(
            init: DialogController(),
            builder: (c) {
              return Form(
                key: c.formKey,
                child: Column(
                  children: [
                    const Text("Not Düzenle",  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23)),
                    TextFormField(
                      maxLines: 2,
                      decoration: const InputDecoration(hintText: "Başlık Girin"),
                      validator: ValidatorManager.defaultEmptyCheckValidator,
                      controller: c.titleController..text = c.detailTitle ?? title,
                    ),
                    TextFormField(
                      maxLines: 4,
                      decoration: const InputDecoration(hintText: "İçerik Girin"),
                      validator: ValidatorManager.defaultEmptyCheckValidator,
                      controller: c.descriptionController..text = c.detailContent ?? detail,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: MaterialButton(
                          color: Colors.orange,
                          child: const Text("GÜNCELLE"),
                          onPressed: () async {
                            if (c.formKey.currentState!.validate()) {
                              c.noteUpdate(id: id);
                              Get.back();
                            }
                          }),
                    ),
                  ],
                ),
              );
            }));
  }
}
