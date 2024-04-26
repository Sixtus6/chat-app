import 'package:chatapp/model/chatroom.model.dart';
import 'package:chatapp/services/api/api_client.dart';
import 'package:chatapp/services/api/end_point.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stacked/stacked.dart';

class HomeScreenViewModel extends BaseViewModel {
  List<ChatRoom> chatRooms = [];
  getMessage() async {
    try {
      setBusy(true);
      var data = await ApiClient().fetchData(Endpoints.chatRoom);
      for (var data in data['data']) {
        print(data);
        chatRooms.add(ChatRoom.fromJson(data));
      }
      setBusy(false);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }
}
