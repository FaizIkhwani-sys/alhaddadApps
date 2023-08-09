import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BankRepository extends BaseRepository {
  Future<List<Bank>?> getBank() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl, path: 'dynamic/getBank', accessToken: bearerToken);

    if (response == null) return null;
    List list = response["getBank"];
    List<Bank> bank = list.map((e) => Bank.fromJson(e)).toList();

    return bank;
  }

  Future<List<Pilihan>?> getCurrentBank(String bankId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getCurrentBank',
        accessToken: bearerToken,
        queryParameters: {"currentBankId": bankId});

    if (response == null) return null;
    List list = response["getCurrentBank"];
    List<Pilihan> currentBank = list.map((e) => Pilihan.fromJson(e)).toList();

    return currentBank;
  }

  Future<List<BankSetting>?> getBankSetting() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profileId = _prefs.getString('profileId');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getBankSetting',
        accessToken: bearerToken,
        queryParameters: {
          "profileId": profileId!,
        });

    if (response == null) return null;
    List list = response["getBankSetting"];
    List<BankSetting> bank = list.map((e) => BankSetting.fromJson(e)).toList();

    return bank;
  }
}
