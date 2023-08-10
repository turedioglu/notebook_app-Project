import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notebook_app/app/controllers/dialog_controller.dart';
import 'package:notebook_app/app/ui/pages/note_detail_page/widgets/note_detail_dialogs.dart';
import 'note_detail_controller.dart';

class NoteDetailPage extends GetView<NoteDetailController> {
  final String title;
  final String detail;
  final String id;
  const NoteDetailPage({required this.title, required this.detail, required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Notes Detail",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                try {
                  NoteDetailDialogs().updateDialogs(context: context, title: title, detail: detail, id: id);
                } catch (e) {
                  print(e);
                }
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.black,
              )),
          GetBuilder<NoteDetailController>(
            init: NoteDetailController(),
            builder: (c) {
              return IconButton(
                onPressed: () async {
                  try {
                    c.noteDelete(id);
                    Navigator.pop(context);
                  } catch (e) {
                    print(e);
                  }
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetBuilder<DialogController>(
              init: DialogController(),
              builder: (c) {
                return Container(
                  decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(c.detailTitle ?? title),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text(c.detailContent ?? detail),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
