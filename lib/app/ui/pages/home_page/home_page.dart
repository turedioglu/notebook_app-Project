import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notebook_app/app/ui/pages/home_page/widgets/home_dialogs.dart';
import 'package:notebook_app/app/ui/pages/note_detail_page/note_detail_page.dart';
import 'package:notebook_app/core/init/network/network_manager.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Notes",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          GetBuilder<HomeController>(builder: (c) {
            return IconButton(
                onPressed: () async {
                  c.deleteAllNotes();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                ));
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          HomeDialogs().addNoteDialog(context: context);
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: NetworkManager.instance.getNotes,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final notes = snapshot.data?.docs;
                return ListView.builder(
                  itemCount: notes?.length ?? 0,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NoteDetailPage(
                              title: notes?[index]["title"] ?? "",
                              detail: notes?[index]["content"] ?? "",
                              id: notes?[index].id ?? "",
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(notes?[index]["title"] ?? ""),
                                    Text(
                                      (notes?[index]["content"] ?? ""),
                                      style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
