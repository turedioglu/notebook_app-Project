import 'package:get/get.dart';

import '../../../../core/init/network/network_manager.dart';

class NoteDetailController extends GetxController {
  noteDelete(String id) {
    NetworkManager.instance.notesCollection.doc(id).delete();
  }
}
