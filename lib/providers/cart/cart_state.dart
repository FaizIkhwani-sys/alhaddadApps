import 'package:apps_al_haddad/al_haddad.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartState extends ChangeNotifier with TextControllerMixin {
  final _cartRepo = CartRepository();
  final _ordersRepo = OrdersRepository();
  final _paymentRepo = PaymentRepository();
  final _profileRepo = ProfileRepository();
  final _addressRepo = AddressRepository();
  final _pointsRepo = PointsRepository();
  final _productsRepo = ProductsRepository();
  final _courierRepo = CourierRepository();
  final _negeriRepo = NegeriRepository();
  final _daerahRepo = DaerahRepository();
  final _premisRepo = PremisRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isInformationComplete = false;
  bool get isInformationComplete => _isInformationComplete;
  set isInformationComplete(bool value) {
    _isInformationComplete = value;
    notifyListeners();
  }

  List<double> _weight = [];
  List<double> get weight => _weight;
  set weight(List<double> value) {
    _weight = value;
    notifyListeners();
  }

  List<double> _shippingRatesList = [];
  List<double> get shippingRatesList => _shippingRatesList;
  set shippingRatesList(List<double> value) {
    _shippingRatesList = value;
    notifyListeners();
  }

  List<Cart>? _cartList;
  List<Cart>? get cartList => _cartList;

  List<Weight>? _weightByPremis;
  List<Weight>? get weightByPremis => _weightByPremis;

  List<OrderId>? _orderIdList;
  List<OrderId>? get orderIdList => _orderIdList;

  List<SubTotal>? _orderSubTotal;
  List<SubTotal>? get orderSubTotal => _orderSubTotal;

  List<CashGiven>? _cashGiven;
  List<CashGiven>? get cashGiven => _cashGiven;

  List<ToyyibKey>? _toyyibKey;
  List<ToyyibKey>? get toyyibKey => _toyyibKey;

  List<ToyyibKey>? _catCode;
  List<ToyyibKey>? get catCode => _catCode;

  List<Profile>? _profileList;
  List<Profile>? get profileList => _profileList;

  List<Address>? _address;
  List<Address>? get address => _address;

  List<GetUserPoints>? _userPoints;
  List<GetUserPoints>? get userPoints => _userPoints;

  List? _billerCode;
  List? get billerCode => _billerCode;

  List<Setting>? _setting;
  List<Setting>? get setting => _setting;

  List<Courier>? _courierList;
  List<Courier>? get courierList => _courierList;

  List<Pilihan>? _negeriList;
  List<Pilihan>? get negeriList => _negeriList;

  List<Pilihan>? _daerahList;
  List<Pilihan>? get daerahList => _daerahList;

  List<Pilihan>? _currentNegeri;
  List<Pilihan>? get currentNegeri => _currentNegeri;

  List<Pilihan>? _currentDaerah;
  List<Pilihan>? get currentDaerah => _currentDaerah;

  List<OrderDetailsPremis>? _orderDetailsPremis;
  List<OrderDetailsPremis>? get orderDetailsPremis => _orderDetailsPremis;

  List<ShippingRates>? _shippingRates;
  List<ShippingRates>? get shippingRates => _shippingRates;
  set shippingRates(List<ShippingRates>? value) {
    _shippingRates = value;
    notifyListeners();
  }

  List<OrderCost>? _orderCost;
  List<OrderCost>? get orderCost => _orderCost;

  Courier _courier = Courier();
  Courier get courier => _courier;
  set courier(Courier value) {
    _courier = value;

    // getCashGiven();

    if (bearerToken != null) {
      validateCourier();
      shipping(address![0].idNegeri!, _courier.id!);
    } else if (bearerToken == null) {
      validateCourier();
      shipping(negeriGuest!.id!, _courier.id!);
    }

    notifyListeners();
  }

  Pilihan? _negeriGuest;
  Pilihan? get negeriGuest => _negeriGuest;
  set negeriGuest(Pilihan? value) {
    _negeriGuest = value;
    _daerahList = null;
    idNegeriGuest = negeriGuest!.id!.toString();
    getCurrentNegeri(idNegeriGuest);
    getDaerah(idNegeriGuest);
    validateNegeri();
    notifyListeners();
  }

  String _idNegeriGuest = '';
  String get idNegeriGuest => _idNegeriGuest;
  set idNegeriGuest(String value) {
    _idNegeriGuest = value;
    notifyListeners();
  }

  Pilihan? _daerahGuest;
  Pilihan? get daerahGuest => _daerahGuest;
  set daerahGuest(Pilihan? value) {
    _daerahGuest = value;
    idDaerahGuest = daerahGuest!.id!.toString();
    getCurrentDaerah(idDaerahGuest);
    validateDaerah();
    notifyListeners();
  }

  String _idDaerahGuest = '';
  String get idDaerahGuest => _idDaerahGuest;
  set idDaerahGuest(String value) {
    _idDaerahGuest = value;
    notifyListeners();
  }

  String _points = '0.00';
  String get points => _points;
  set points(String value) {
    _points = value;
    if (bearerToken != null) {
      validatePoints();
    }
    notifyListeners();
  }

  String? _idProfile;
  String? get idProfile => _idProfile;
  set idProfile(String? value) {
    _idProfile = value;
    notifyListeners();
  }

  String? _bearerToken;
  String? get bearerToken => _bearerToken;
  set bearerToken(String? value) {
    _bearerToken = value;
    notifyListeners();
  }

  String _guestName = '';
  String get guestName => _guestName;
  set guestName(String value) {
    _guestName = value;
    notifyListeners();
  }

  String _guestEmail = '';
  String get guestEmail => _guestEmail;
  set guestEmail(String value) {
    _guestEmail = value;
    notifyListeners();
  }

  String _guestNoPhone = '';
  String get guestNoPhone => _guestNoPhone;
  set guestNoPhone(String value) {
    _guestNoPhone = value;
    notifyListeners();
  }

  String _guestAddress = '';
  String get guestAddress => _guestAddress;
  set guestAddress(String value) {
    _guestAddress = value;
    notifyListeners();
  }

  String _guestPostcode = '';
  String get guestPostcode => _guestPostcode;
  set guestPostcode(String value) {
    _guestPostcode = value;
    notifyListeners();
  }

  String _guestBandar = '';
  String get guestBandar => _guestBandar;
  set guestBandar(String value) {
    _guestBandar = value;
    notifyListeners();
  }

  double? _totalPayment;
  double? get totalPayment => _totalPayment;
  set totalPayment(double? value) {
    _totalPayment = value;
    notifyListeners();
  }

  bool _usePoints = false;
  bool get usePoints => _usePoints;
  set usePoints(bool value) {
    _usePoints = value;
    if (_usePoints == false) {
      points = '0.00';
    }
    notifyListeners();
  }

  bool _selfCollect = false;
  bool get selfCollect => _selfCollect;
  set selfCollect(bool value) {
    _selfCollect = value;
    if (_selfCollect == true) {
      idSelfCollect = '1';
    } else if (_selfCollect == false) {
      idSelfCollect = '0';
      // courier = null;
      shippingRates = null;
    }
    print('idSelfCollect $idSelfCollect');
    notifyListeners();
  }

  String? _idSelfCollect;
  String? get idSelfCollect => _idSelfCollect;
  set idSelfCollect(String? value) {
    _idSelfCollect = value;
    notifyListeners();
  }

  String? _courierError;
  String? get courierError => _courierError;
  bool get courierHasError => !_courierError.isNullOrWhiteSpace;

  String _pointsError = '';
  String get pointsError => _pointsError;
  bool get pointsHasError => !_pointsError.isNullOrWhiteSpace;

  String _guestNameError = '';
  String get guestNameError => _guestNameError;
  bool get guestNameHasError => !_guestNameError.isNullOrWhiteSpace;

  String _guestEmailError = '';
  String get guestEmailError => _guestEmailError;
  bool get guestEmailHasError => !_guestEmailError.isNullOrWhiteSpace;

  String _guestNoPhoneError = '';
  String get guestNoPhoneError => _guestNoPhoneError;
  bool get guestNoPhoneHasError => !_guestNoPhoneError.isNullOrWhiteSpace;

  String _guestAddressError = '';
  String get guestAddressError => _guestAddressError;
  bool get guestAddressHasError => !_guestAddressError.isNullOrWhiteSpace;

  String _guestPostcodeError = '';
  String get guestPostcodeError => _guestPostcodeError;
  bool get guestPostcodeHasError => !_guestPostcodeError.isNullOrWhiteSpace;

  String _guestBandarError = '';
  String get guestBandarError => _guestBandarError;
  bool get guestBandarHasError => !_guestBandarError.isNullOrWhiteSpace;

  String _guestNegeriError = '';
  String get guestNegeriError => _guestNegeriError;
  bool get guestNegeriHasError => !_guestNegeriError.isNullOrWhiteSpace;

  String _guestDaerahError = '';
  String get guestDaerahError => _guestDaerahError;
  bool get guestDaerahHasError => !_guestDaerahError.isNullOrWhiteSpace;

  Future getSetting() async {
    try {
      _isLoading = true;
      final response = await _productsRepo.getSetting();

      if (response != null) {
        _setting = response;
      }
    } catch (e) {
      _setting = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getShippingRates(String weight, String premisId, String negeriPenerima,
      String courierId) async {
    try {
      final response = await _courierRepo.getShippingRates(
          weight, premisId, negeriPenerima, courierId);

      if (response != null) {
        _shippingRates = response;
      }
    } finally {
      notifyListeners();
    }
  }

  Future getWeight(String premisId) async {
    try {
      final response = await _courierRepo.getWeight(premisId);

      if (response != null) {
        _weightByPremis = response;
      }
    } finally {
      notifyListeners();
    }
  }

  Future getUserPoints() async {
    try {
      _isLoading = true;

      final response =
          await _pointsRepo.getUserPoints(profileList![0].noPengenalan!);

      if (response != null) {
        _userPoints = response;
      }
    } catch (e) {
      _userPoints = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getCourier() async {
    try {
      _isLoading = true;

      final response = await _courierRepo.getCourier();

      if (response != null) {
        _courierList = response;
      }
    } catch (e) {
      _courierList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getProfile() async {
    try {
      _isLoading = true;
      final response = await _profileRepo.getProfile('');

      if (response != null) {
        _profileList = response;

        SharedPreferences prefs = await SharedPreferences.getInstance();

        idProfile = prefs.getString('profileId');
      }
    } catch (e) {
      _profileList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getAddress() async {
    try {
      _isLoading = true;
      final response = await _addressRepo.getAddress();

      if (response != null) {
        _address = response;
      }
    } catch (e) {
      _address = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getOrderIdList() async {
    try {
      _isLoading = true;

      final response = await _ordersRepo.getOrderIdList();

      if (response != null) {
        _orderIdList = response;
      }
    } catch (e) {
      _orderIdList = null;
    } finally {
      _isLoading = false;

      await addOrderId();
      // await getOrderListWithPremisId(premisId);

      notifyListeners();
    }
  }

  Future addOrderId() async {
    List<String> orderIdAdd = [];
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      for (int i = 0; i < _orderIdList!.length; i++) {
        await getCartList(_orderIdList![i].id!);
        orderIdAdd.add('${_orderIdList![i].id!}');
        _prefs.setString('orderIdList', '${textSelect(orderIdAdd.toString())}');
      }
    } catch (e) {
    } finally {
      notifyListeners();
    }
  }

  textSelect(String orderId) {
    orderId = orderId.replaceAll(' ', '');
    orderId = orderId.replaceAll('[', '');
    orderId = orderId.replaceAll(']', '');

    return orderId;
  }

  Future getCart() async {
    try {
      _isLoading = true;

      final response = await _cartRepo.getCart();

      if (response != null) {
        _cartList = response;
      }
    } catch (e) {
      _cartList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getCartList(String orderId) async {
    try {
      _isLoading = true;

      final response = await _cartRepo.getCartList(orderId);

      if (response != null) {
        _cartList = response;
      }
    } catch (e) {
      _cartList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future updateQuantity(BuildContext context, String orderDetailsId,
      String quantity, String price) async {
    try {
      final response =
          await _cartRepo.updateQuantity(orderDetailsId, quantity, price);
    } finally {
      notifyListeners();
    }
  }

  Future updatePointDeduct(String points) async {
    try {
      final response = await _ordersRepo.updatePointsDeduct(points);
    } finally {
      notifyListeners();
    }
  }

  Future getSubTotal() async {
    try {
      _isLoading = true;

      final response = await _ordersRepo.getSubTotal();

      if (response != null) {
        _orderSubTotal = response;
      }
    } catch (e) {
      _orderSubTotal = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getOrderDetailsPremis() async {
    try {
      _isLoading = true;

      final response = await _premisRepo.getOrderDetailsPremis();

      if (response != null) {
        _orderDetailsPremis = response;
      }
    } catch (e) {
      _orderDetailsPremis = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getSubTotalList() async {
    try {
      _isLoading = true;

      final response = await _ordersRepo.getSubTotal();

      if (response != null) {
        _orderSubTotal = response;
      }
    } catch (e) {
      _orderSubTotal = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getCashGiven() async {
    try {
      _isLoading = true;

      final response = await _ordersRepo.getCashGiven();

      if (response != null) {
        _cashGiven = response;
        print('cash given done');
      }
    } catch (e) {
      _cashGiven = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future updateSubTotal(BuildContext context) async {
    try {
      final response = await _ordersRepo.updateSubTotal(
          orderSubTotal![0].sumHarga!, setting![0].value!);
    } finally {
      notifyListeners();
    }
  }

  Future updateNewCashGiven() async {
    try {
      final response = await _courierRepo.updateNewCashGiven(
          orderCost![0].grandTotal!,
          orderCost![0].cashGiven!,
          orderCost![0].shippingCost!);
    } finally {
      notifyListeners();
    }
  }

  // updateCashGiven yang ori
  // Future updateCashGiven(String url) async {
  //   try {
  //     if (url.contains("status_id=3")) {
  //       totalPayment = double.parse(orderSubTotal![0].sumHarga!) +
  //           double.parse(setting![0].value!) / 100;
  //
  //       final response =
  //           await _ordersRepo.updateCashGiven(totalPayment.toString());
  //     } else {
  //       if (double.parse(points!) > double.parse(cashGiven![0].cashGiven!)) {
  //         totalPayment =
  //             double.parse(points!) - double.parse(cashGiven![0].cashGiven!);
  //
  //         final response =
  //             await _ordersRepo.updateCashGiven(totalPayment.toString());
  //       } else if (double.parse(cashGiven![0].cashGiven!) >
  //           double.parse(points!)) {
  //         totalPayment =
  //             double.parse(cashGiven![0].cashGiven!) - double.parse(points!);
  //
  //         final response =
  //             await _ordersRepo.updateCashGiven(totalPayment.toString());
  //       }
  //     }
  //   } finally {
  //     notifyListeners();
  //   }
  // }

  // updateCashGiven yang copy ori
  Future updateCashGiven(String url, String cashGiven) async {
    try {
      if (url.contains("status_id=3")) {
        totalPayment = double.parse(orderSubTotal![0].sumHarga!) +
            double.parse(setting![0].value!) / 100;

        final response =
            await _ordersRepo.updateCashGiven(totalPayment.toString());
      } else {
        if (double.parse(points!) > double.parse(cashGiven)) {
          totalPayment = double.parse(points!) - double.parse(cashGiven);

          final response =
              await _ordersRepo.updateCashGiven(totalPayment.toString());
        } else if (double.parse(cashGiven) > double.parse(points!)) {
          totalPayment = double.parse(cashGiven) - double.parse(points!);

          final response =
              await _ordersRepo.updateCashGiven(totalPayment.toString());
        }
      }
    } finally {
      notifyListeners();
    }
  }

  Future updateShippingRate() async {
    try {
      _isLoading = true;

      final response = await _courierRepo
          .updateShippingRate('${shippingRatesList.reduce((a, b) => a + b)}');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future updateOrderDetails(
      String cashGiven,
      String shippingCost,
      String pointsDeduct,
      String grandTotal,
      String noIc,
      String namaPenuh,
      String noTel,
      String billCode) async {
    try {
      _isLoading = true;

      final response = await _ordersRepo.updateOrderDetails(
          cashGiven,
          shippingCost,
          pointsDeduct,
          grandTotal,
          noIc,
          namaPenuh,
          noTel,
          billCode);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future updateAlamat() async {
    try {
      _isLoading = true;

      final response = await _ordersRepo.updateAlamat();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future deleteCartProduct(BuildContext context, String idOrderDetails) async {
    try {
      final response = await _cartRepo.deleteCartProduct(idOrderDetails);
    } finally {
      notifyListeners();
    }
  }

  Future deleteOrder(BuildContext context) async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      String? orderId = _prefs.getString('orderId');

      final response = await _cartRepo.deleteOrder(orderId!);
    } finally {
      notifyListeners();
    }
  }

  Future shipping(String negeriPenerima, String courierId) async {
    await calculateWeightByPremis(negeriPenerima, courierId);
    await calculateShippingRates(negeriPenerima, courierId);
    // await getShippingRates(weight, premisId, negeriPenerima, courierId);
  }

  calculateWeightByPremis(String negeriPenerima, String courierId) async {
    for (int i = 0; i < orderDetailsPremis!.length; i++) {
      await getWeight(orderDetailsPremis![i].premisId!);
      weight.add(double.parse(weightByPremis![0].weight!));
      print('weight kat sini $weight');
    }
  }

  calculateShippingRates(String negeriPenerima, String courierId) async {
    for (int j = 0; j < weight.length; j++) {
      await getShippingRates('${weight[j]}', orderDetailsPremis![j].premisId!,
          negeriPenerima, courierId);
      shippingRatesList.add(double.parse(shippingRates![0].shippingRates!));
      print('ship rate sini $shippingRatesList');
      // print(
      //     'i = $i , j = $j , weight.length = ${weight.length} , orderDetailsPremis!.length = ${orderDetailsPremis!.length}');
    }
    print('tambah ${shippingRatesList.reduce((a, b) => a + b)}');
  }

  Future getAll() async {
    getCart();
    getSubTotal();
  }

  Future getAllConfirm() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      _isLoading = true;

      bearerToken = _prefs.getString('BearerToken');
      if (bearerToken != null) {
        await getSetting();
        await getProfile();
        await getAddress();
        await getCart();
        await getSubTotal();
        await getUserPoints();
        await getCourier();
        await getOrderDetailsPremis();
        selfCollect = false;
        print('point = $points');
      } else {
        await getSetting();
        await getCart();
        await getSubTotal();
        await getCourier();
        await getOrderDetailsPremis();
        selfCollect = false;
        print('point = $points');
      }

      print('habis terus');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  getSemua() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await getAllConfirm();
    await getCashGiven();
    if (bearerToken == null) {
      guestName = _prefs.getString('guestName')!;
      guestEmail = _prefs.getString('guestEmail')!;
      guestNoPhone = _prefs.getString('guestNoPhone')!;
      guestAddress = _prefs.getString('guestAddress')!;
      guestPostcode = _prefs.getString('guestPostcode')!;
      guestBandar = _prefs.getString('guestBandar')!;
      idNegeriGuest = _prefs.getString('idNegeriGuest')!;
      idDaerahGuest = _prefs.getString('idDaerahGuest')!;

      getCurrentNegeri(idNegeriGuest);
      getCurrentDaerah(idDaerahGuest);

      if (guestName != '') {
        isInformationComplete = true;
      }
    }
  }

  saveGuestInformation(BuildContext context) async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      _prefs.setString('guestName', guestName);
      _prefs.setString('guestEmail', guestEmail);
      _prefs.setString('guestNoPhone', guestNoPhone);
      _prefs.setString('guestAddress', guestAddress);
      _prefs.setString('guestPostcode', guestPostcode);
      _prefs.setString('guestBandar', guestBandar);
      _prefs.setString('idNegeriGuest', idNegeriGuest);
      _prefs.setString('idDaerahGuest', idDaerahGuest);

      await updateGuestDeliveryInformation(context);
    } finally {
      showDialog(
        useSafeArea: true,
        context: context,
        builder: (_) => AppAlertDialog(
          alertDialogType: AlertDialogType.success,
          title: 'Congratulation',
          subtitle: 'Your information have been saved',
          // description: 'Sila kemaskini maklumat anda.',
          actionButtons: [
            ActionButton(
              label: 'BACK',
              onTap: () => {
                AppRoute.pop(context),
                AppRoute.pop(context),
              },
              color: primaryColor,
            ),
          ],
        ),
      );
      notifyListeners();
    }
  }

  //=================================================================================

  Future getToyyibKey() async {
    try {
      final response = await _paymentRepo.getToyyibKey();

      if (response != null) {
        _toyyibKey = response;
      }
    } catch (e) {
      _toyyibKey = null;
    } finally {
      notifyListeners();
    }
  }

  Future getCatCode() async {
    try {
      final response = await _paymentRepo.getCatCode();

      if (response != null) {
        _catCode = response;
      }
    } catch (e) {
      _catCode = null;
    } finally {
      notifyListeners();
    }
  }

  Future postToyyib(
      String points, String cashGiven, String shippingRates) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? idProfile = prefs.getString('profileId');
    String? email = prefs.getString('userEmail');
    String? bearerToken = prefs.getString('BearerToken');

    if (bearerToken != null) {
      if (double.parse(points) > double.parse(cashGiven)) {
        print('p lebih');
        final response = await _paymentRepo.postToyyib(
            toyyibKey![0].value!,
            catCode![0].value!,
            profileList![0].namaPenuh,
            email,
            profileList![0].noTel,
            (double.parse(points) - double.parse(cashGiven)) * 100,
            idProfile);

        if (response != null) {
          _billerCode = response;
          print('_billerCode $_billerCode');
        }
      } else if (double.parse(points) < double.parse(cashGiven)) {
        print('cashGivenF $cashGiven');
        print('pointsF $points');
        print('shippingRatesF $shippingRates');
        final response = await _paymentRepo.postToyyib(
            toyyibKey![0].value!,
            catCode![0].value!,
            profileList![0].namaPenuh,
            email,
            profileList![0].noTel,
            (double.parse(cashGiven) - double.parse(points)) * 100,
            idProfile);

        if (response != null) {
          _billerCode = response;
          print('_billerCode $_billerCode');
        }
      }
    } else {
      print('cashGivenF $cashGiven');
      print('pointsF $points');
      print('shippingRatesF $shippingRates');
      final response = await _paymentRepo.postToyyib(
          toyyibKey![0].value!,
          catCode![0].value!,
          guestName,
          guestEmail,
          guestNoPhone,
          (double.parse(cashGiven) - double.parse(points)) * 100,
          '');

      if (response != null) {
        _billerCode = response;
        print('_billerCode $_billerCode');
      }
    }
  }

  Future postLoyalty(String points) async {
    try {
      _isLoading = true;

      final response = await _ordersRepo.postLoyalty(points);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getPayment(BuildContext context) async {
    try {
      _isLoading = true;

      if (bearerToken != null) {
        if (selfCollect == true) {
          if (usePoints == true) {
            if (double.parse(points!) >=
                (double.parse(cashGiven![0].cashGiven!) +
                    double.parse('0.00'))) {
              await updateOrderDetails(
                  "${double.parse(points!) - (double.parse(cashGiven![0].cashGiven!) + double.parse('0.00'))}",
                  '0.00',
                  points!,
                  "${(double.parse(cashGiven![0].cashGiven!) + double.parse('0.00'))}",
                  profileList![0].noPengenalan!,
                  profileList![0].namaPenuh!,
                  profileList![0].noTel!,
                  '');
              // await updatePointDeduct(points!);
              // await updateCashGiven('',
              //     '${double.parse(cashGiven![0].cashGiven!) + double.parse(shippingRates![0].shippingRates!)}');
              // await getCashGiven();
              await showDialog(
                useSafeArea: true,
                context: context,
                builder: (_) => AppAlertDialog(
                  alertDialogType: AlertDialogType.success,
                  title: 'Congratulations',
                  subtitle: 'Payment Success',
                  // description: 'Sila kemaskini maklumat anda.',
                  actionButtons: [
                    ActionButton(
                      label: 'Back',
                      onTap: () {
                        AppRoute.pop(context);
                        AppRoute.pop(context);
                      },
                      color: successColor,
                    ),
                  ],
                ),
              );
            } else if (double.parse(points!) <
                (double.parse(cashGiven![0].cashGiven!) +
                    double.parse('0.00'))) {
              // await updatePointDeduct(points!);
              // await updateCashGiven('',
              //     '${double.parse(cashGiven![0].cashGiven!) + double.parse(shippingRates![0].shippingRates!)}');
              // await getCashGiven();
              await getProfile();
              await getToyyibKey();
              await getCatCode();
              await postToyyib(
                  points!,
                  '${double.parse(cashGiven![0].cashGiven!) + double.parse('0.00')}',
                  '0.00');
              await AppRoute.push(
                  context,
                  PaymentGatewayPage(
                    billerCode: billerCode![0]["BillCode"],
                    idProfil: idProfile,
                    pointsDeduct: points,
                    grandTotal:
                        '${double.parse(cashGiven![0].cashGiven!) + double.parse('0.00')}',
                    cashGiven:
                        '${(double.parse(cashGiven![0].cashGiven!) + double.parse('0.00')) - double.parse(points!)}',
                    shippingCost: '0.00',
                    noIc: profileList![0].noPengenalan!,
                    selfCollect: selfCollect,
                    namaPenuh: profileList![0].namaPenuh,
                    noTel: profileList![0].noTel,
                  ));
            }
          } else if (usePoints == false) {
            await getProfile();
            await getToyyibKey();
            await getCatCode();
            await postToyyib(
                '0.00',
                '${double.parse(cashGiven![0].cashGiven!) + double.parse('0.00')}',
                '0.00');
            await AppRoute.push(
                context,
                PaymentGatewayPage(
                  billerCode: billerCode![0]["BillCode"],
                  idProfil: idProfile,
                  pointsDeduct: '0.00',
                  grandTotal:
                      '${double.parse(cashGiven![0].cashGiven!) + double.parse('0.00')}',
                  cashGiven:
                      '${double.parse(cashGiven![0].cashGiven!) + double.parse('0.00')}',
                  shippingCost: '0.00',
                  noIc: profileList![0].noPengenalan!,
                  selfCollect: selfCollect,
                  namaPenuh: profileList![0].namaPenuh,
                  noTel: profileList![0].noTel,
                ));
          }
        } else if (selfCollect == false) {
          if (usePoints == true) {
            if (double.parse(points!) >=
                (double.parse(cashGiven![0].cashGiven!) +
                    shippingRatesList.reduce((a, b) => a + b))) {
              await updateOrderDetails(
                  "${double.parse(points!) - (double.parse(cashGiven![0].cashGiven!) + shippingRatesList.reduce((a, b) => a + b))}",
                  '${shippingRatesList.reduce((a, b) => a + b)}',
                  points!,
                  "${(double.parse(cashGiven![0].cashGiven!) + shippingRatesList.reduce((a, b) => a + b))}",
                  profileList![0].noPengenalan!,
                  profileList![0].namaPenuh!,
                  profileList![0].noTel!,
                  '');
              // await updatePointDeduct(points!);
              // await updateCashGiven('',
              //     '${double.parse(cashGiven![0].cashGiven!) + double.parse(shippingRates![0].shippingRates!)}');
              // await getCashGiven();
              await showDialog(
                useSafeArea: true,
                context: context,
                builder: (_) => AppAlertDialog(
                  alertDialogType: AlertDialogType.success,
                  title: 'Congratulations',
                  subtitle: 'Payment Success',
                  // description: 'Sila kemaskini maklumat anda.',
                  actionButtons: [
                    ActionButton(
                      label: 'Back',
                      onTap: () {
                        AppRoute.pop(context);
                        AppRoute.pop(context);
                      },
                      color: successColor,
                    ),
                  ],
                ),
              );
            } else if (double.parse(points!) <
                (double.parse(cashGiven![0].cashGiven!) +
                    shippingRatesList.reduce((a, b) => a + b))) {
              // await updatePointDeduct(points!);
              // await updateCashGiven('',
              //     '${double.parse(cashGiven![0].cashGiven!) + double.parse(shippingRates![0].shippingRates!)}');
              // await getCashGiven();
              await getProfile();
              await getToyyibKey();
              await getCatCode();
              await postToyyib(
                  points!,
                  '${double.parse(cashGiven![0].cashGiven!) + shippingRatesList.reduce((a, b) => a + b)}',
                  '${shippingRatesList.reduce((a, b) => a + b)}');
              await AppRoute.push(
                  context,
                  PaymentGatewayPage(
                    billerCode: billerCode![0]["BillCode"],
                    idProfil: idProfile,
                    pointsDeduct: points,
                    grandTotal:
                        '${double.parse(cashGiven![0].cashGiven!) + shippingRatesList.reduce((a, b) => a + b)}',
                    cashGiven:
                        '${(double.parse(cashGiven![0].cashGiven!) + shippingRatesList.reduce((a, b) => a + b)) - double.parse(points!)}',
                    shippingCost:
                        '${shippingRatesList.reduce((a, b) => a + b)}',
                    noIc: profileList![0].noPengenalan!,
                    selfCollect: selfCollect,
                    namaPenuh: profileList![0].namaPenuh,
                    noTel: profileList![0].noTel,
                  ));
            }
          } else if (usePoints == false) {
            await getProfile();
            await getToyyibKey();
            await getCatCode();
            await postToyyib(
                '0.00',
                '${double.parse(cashGiven![0].cashGiven!) + shippingRatesList.reduce((a, b) => a + b)}',
                '${shippingRatesList.reduce((a, b) => a + b)}');
            await AppRoute.push(
                context,
                PaymentGatewayPage(
                  billerCode: billerCode![0]["BillCode"],
                  idProfil: idProfile,
                  pointsDeduct: '0.00',
                  grandTotal:
                      '${double.parse(cashGiven![0].cashGiven!) + shippingRatesList.reduce((a, b) => a + b)}',
                  cashGiven:
                      '${double.parse(cashGiven![0].cashGiven!) + shippingRatesList.reduce((a, b) => a + b)}',
                  shippingCost: '${shippingRatesList.reduce((a, b) => a + b)}',
                  noIc: profileList![0].noPengenalan!,
                  selfCollect: selfCollect,
                  namaPenuh: profileList![0].namaPenuh,
                  noTel: profileList![0].noTel,
                ));
          }
        }
      } else {
        await getToyyibKey();
        await getCatCode();
        await postToyyib(
            '0.00',
            '${double.parse(cashGiven![0].cashGiven!) + shippingRatesList.reduce((a, b) => a + b)}',
            '${shippingRatesList.reduce((a, b) => a + b)}');
        print('biller guest ${billerCode![0]["BillCode"]}');
        await AppRoute.push(
            context,
            PaymentGatewayPage(
              billerCode: billerCode![0]["BillCode"],
              idProfil: '',
              pointsDeduct: '0.00',
              grandTotal:
                  '${double.parse(cashGiven![0].cashGiven!) + shippingRatesList.reduce((a, b) => a + b)}',
              cashGiven:
                  '${double.parse(cashGiven![0].cashGiven!) + shippingRatesList.reduce((a, b) => a + b)}',
              shippingCost: '${shippingRatesList.reduce((a, b) => a + b)}',
              noIc: '',
              selfCollect: selfCollect,
              namaPenuh: guestName,
              noTel: guestNoPhone,
            ));
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  validatePoints() {
    try {
      _pointsError = '';

      if (points.isNullOrWhiteSpace) {
        _pointsError = '*required';
        points = '0.00';
        return;
      }

      if (double.parse(_points) > double.parse(_userPoints![0].point!)) {
        _pointsError = 'Not enough balance';
        return;
      }

      if (double.parse(_points) >
          (double.parse(cashGiven![0].cashGiven!) + double.parse('0.00'))) {
        _pointsError = 'Exceeded, please insert the right amount';
        return;
      }

      // if (selfCollect == false) {
      //   if (points.isNullOrWhiteSpace) {
      //     _pointsError = '*required';
      //     return;
      //   }
      //
      //   if (double.parse(_points!) > double.parse(_userPoints![0].point!)) {
      //     _pointsError = 'Not enough balance';
      //     return;
      //   }
      //
      //   if (double.parse(_points!) >
      //       (double.parse(cashGiven![0].cashGiven!) +
      //           double.parse(shippingRates![0].shippingRates!))) {
      //     _pointsError = 'Exceeded, please insert the right amount';
      //     return;
      //   }
      // } else if (selfCollect == true) {
      //   if (points.isNullOrWhiteSpace) {
      //     _pointsError = '*required';
      //     points = '0.00';
      //     return;
      //   }
      //
      //   if (double.parse(_points!) > double.parse(_userPoints![0].point!)) {
      //     _pointsError = 'Not enough balance';
      //     return;
      //   }
      //
      //   if (double.parse(_points!) >
      //       (double.parse(cashGiven![0].cashGiven!) + double.parse('0.00'))) {
      //     _pointsError = 'Exceeded, please insert the right amount';
      //     return;
      //   }
      // }
    } finally {
      notifyListeners();
    }
  }

  validateCourier() {
    try {
      _courierError = null;

      // if (courier == null) {
      //   _courierError = '*required';
      //   return;
      // }

      if (selfCollect == false) {
        if (courier == null) {
          _courierError = '*required';
          return;
        }
      }
    } finally {
      notifyListeners();
    }
  }

  validateAll() {
    if (bearerToken != null) {
      if (selfCollect == false) {
        validatePoints();
        validateCourier();
      }
    } else {
      validateCourier();
    }
  }

  //==============================================================================

  Future getAllGuestDeliveryInformation() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    getNegeri();

    idNegeriGuest = _prefs.getString('idNegeriGuest')!;
    idDaerahGuest = _prefs.getString('idDaerahGuest')!;

    getCurrentNegeri(idNegeriGuest);
    getCurrentDaerah(idDaerahGuest);
    getDaerah(idNegeriGuest);
  }

  Future getDaerah(String idNegeri) async {
    try {
      final response = await _daerahRepo.getDaerah(idNegeri);

      if (response != null) {
        _daerahList = response;
      }
    } catch (e) {
      _daerahList = null;
    } finally {
      notifyListeners();
    }
  }

  Future getNegeri() async {
    try {
      _isLoading = true;

      final response = await _negeriRepo.getNegeri();

      if (response != null) {
        _negeriList = response;
      }
    } catch (e) {
      _negeriList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getCurrentNegeri(String currentID) async {
    try {
      final response = await _negeriRepo.getCurrentNegeri(currentID);

      if (response != null) {
        _currentNegeri = response;
      }
    } catch (e) {
      _currentNegeri = null;
    } finally {
      notifyListeners();
    }
  }

  Future getCurrentDaerah(String currentID) async {
    try {
      final response = await _daerahRepo.getCurrentDaerah(currentID);

      if (response != null) {
        _currentDaerah = response;
      }
    } catch (e) {
      _currentDaerah = null;
    } finally {
      notifyListeners();
    }
  }

  Future updateGuestDeliveryInformation(BuildContext context) async {
    try {
      _isLoading = true;
      final response = await _addressRepo.updateGuestDeliveryInformation(
          guestName,
          guestNoPhone,
          guestEmail,
          guestAddress,
          guestPostcode,
          guestBandar,
          idDaerahGuest,
          idNegeriGuest);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  validateAllGuestDeliveryInformation() {
    validateGuestName();
    validateGuestEmail();
    validateGuestPhone();
    validateGuestAddress();
    validateGuestPostal();
    validateGuestTown();
    validateNegeri();
    validateDaerah();
  }

  validateGuestName() {
    try {
      _guestNameError = '';
      if (guestName.isNullOrWhiteSpace) {
        _guestNameError = '*required';
        return;
      }
    } finally {
      notifyListeners();
    }
  }

  validateGuestEmail() {
    try {
      _guestEmailError = '';
      if (guestEmail.isNullOrWhiteSpace) {
        _guestEmailError = '*required';
        return;
      }
    } finally {
      notifyListeners();
    }
  }

  validateGuestPhone() {
    try {
      _guestNoPhoneError = '';
      if (guestNoPhone.isNullOrWhiteSpace) {
        _guestNoPhoneError = '*required';
        return;
      }
    } finally {
      notifyListeners();
    }
  }

  validateGuestAddress() {
    try {
      _guestAddressError = '';
      if (guestAddress.isNullOrWhiteSpace) {
        _guestAddressError = '*required';
        return;
      }
    } finally {
      notifyListeners();
    }
  }

  validateGuestPostal() {
    try {
      _guestPostcodeError = '';
      if (guestPostcode.isNullOrWhiteSpace) {
        _guestPostcodeError = '*required';
        return;
      }
    } finally {
      notifyListeners();
    }
  }

  validateGuestTown() {
    try {
      _guestBandarError = '';
      if (guestBandar.isNullOrWhiteSpace) {
        _guestBandarError = '*required';
        return;
      }
    } finally {
      notifyListeners();
    }
  }

  validateNegeri() {
    try {
      _guestNegeriError = '';
      if (idNegeriGuest.isNullOrWhiteSpace) {
        _guestNegeriError = '*required';
        return;
      }
    } finally {
      notifyListeners();
    }
  }

  validateDaerah() {
    try {
      _guestDaerahError = '';
      if (idDaerahGuest.isNullOrWhiteSpace) {
        _guestDaerahError = '*required';
        return;
      }
    } finally {
      notifyListeners();
    }
  }
}
