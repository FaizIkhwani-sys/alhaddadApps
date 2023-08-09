import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationRepository extends BaseRepository {
  Future<List<Notifications>?> getNotification() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profileId = _prefs.getString('profileId');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getNotification',
        accessToken: bearerToken,
        queryParameters: {"profileId": profileId!});

    if (response == null) return null;
    List list = response["getNotification"];
    List<Notifications> notificationList =
        list.map((e) => Notifications.fromJson(e)).toList();

    return notificationList;
  }

  Future<List<NewNoti>?> getNewNotification() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profileId = _prefs.getString('profileId');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getNewNoti',
          accessToken: bearerToken,
          queryParameters: {"profileId": profileId!});

      if (response == null) return null;
      List list = response["getNewNoti"];
      List<NewNoti> newNoti = list.map((e) => NewNoti.fromJson(e)).toList();

      return newNoti;
    } else {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getNewNoti',
          queryParameters: {"profileId": profileId!, "guestMode": "1"});

      if (response == null) return null;
      List list = response["getNewNoti"];
      List<NewNoti> newNoti = list.map((e) => NewNoti.fromJson(e)).toList();

      return newNoti;
    }
  }

  Future<List<Notifications>?> getNotificationbyId(
      String idNotification) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profileId = _prefs.getString('profileId');
    print('id noti = $idNotification');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getNotificationbyId',
        accessToken: bearerToken,
        queryParameters: {
          "idNotification": idNotification,
          "profileId": profileId!
        });

    if (response == null) return null;
    List list = response["getNotificationbyId"];
    List<Notifications> notification =
        list.map((e) => Notifications.fromJson(e)).toList();

    return notification;
  }

  Future deleteNotification(String idNotification) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await apiHelper.deleteRequestWithToken(
      hostUrl: baseApiUrl,
      path: "notifikasiSend/$idNotification",
      accessToken: bearerToken,
    );
    if (response == null) return null;
    print('repo $response');
    return response;
  }

  Future deleteOrderPOS(String orderId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    print('bkkkk $bearerToken');

    final response = await apiHelper.postRequestWithToken(
        hostUrl: baseApiUrl,
        path: "padamOrder?padamOrder=1",
        accessToken: bearerToken,
        data: {"order_id": "$orderId"});
    if (response == null) return null;
    print(response);
    return response;
  }

  Future postNotification(String title, String body, String image,
      String pilihanJenisNotifikasi) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await apiHelper.postRequestWithToken(
        hostUrl: baseApiUrl,
        path: "sendNoti",
        accessToken: bearerToken,
        data: {
          "title": "$title",
          "body": "$body",
          "image": "$image",
          "pilihanJenisNotifikasi": "$pilihanJenisNotifikasi"
        });
    if (response == null) return null;
    print('postNotification $response');
    return response;
  }

  Future updateReadAt(String idNotiSend, String readAt) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await apiHelper.updateRequestWithToken(
        hostUrl: baseApiUrl,
        path: "notifikasiSend/$idNotiSend",
        accessToken: bearerToken,
        data: {"read_at": "$readAt"});
    if (response == null) return null;
    print('updateReadAt $response');
    return response;
  }
}
