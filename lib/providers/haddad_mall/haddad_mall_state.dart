import 'package:apps_al_haddad/al_haddad.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class HaddadMallState extends ChangeNotifier {
  final _productsRepo = ProductsRepository();
  final _ordersRepo = OrdersRepository();
  final _profileRepo = ProfileRepository();
  final _paymentRepo = PaymentRepository();
  final _premisRepo = PremisRepository();
  final _cartRepo = CartRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Profile>? _profileList;
  List<Profile>? get profileList => _profileList;

  List<Products>? _productsList;
  List<Products>? get productsList => _productsList;

  List<SingleProduct>? _singleProductList;
  List<SingleProduct>? get singleProductList => _singleProductList;

  List<Orders1>? _order;
  List<Orders1>? get order => _order;

  List<SubTotal>? _orderSubTotal;
  List<SubTotal>? get orderSubTotal => _orderSubTotal;

  List<ToyyibKey>? _toyyibKey;
  List<ToyyibKey>? get toyyibKey => _toyyibKey;

  List<ToyyibKey>? _catCode;
  List<ToyyibKey>? get catCode => _catCode;

  List<OrderDetails>? _orderDetails;
  List<OrderDetails>? get orderDetails => _orderDetails;

  List<Setting>? _setting;
  List<Setting>? get setting => _setting;

  List<PremisAll>? _premisAll;
  List<PremisAll>? get premisAll => _premisAll;

  List<OrderId>? _orderId;
  List<OrderId>? get orderId => _orderId;

  List<OrderId>? _orderIdList;
  List<OrderId>? get orderIdList => _orderIdList;

  List<OrderId>? _orderListWithPremisId;
  List<OrderId>? get orderListWithPremisId => _orderListWithPremisId;

  List<PremisOrderDetails>? _premisOrderDetails;
  List<PremisOrderDetails>? get premisOrderDetails => _premisOrderDetails;

  List<ProductOrderDetails>? _productOrderDetails;
  List<ProductOrderDetails>? get productOrderDetails => _productOrderDetails;

  int _quantity = 1;
  int get quantity => _quantity;
  set quantity(int value) {
    _quantity = value;
    _price = double.parse(singleProductList![0].harga!) * quantity;
    notifyListeners();
  }

  double? _price;
  double? get price => _price;
  set price(double? value) {
    _price = value;
    notifyListeners();
  }

  String? _androidVersion;
  String? get androidVersion => _androidVersion;
  set androidVersion(String? value) {
    _androidVersion = value;
    notifyListeners();
  }

  String? _iOSVersion;
  String? get iOSVersion => _iOSVersion;
  set iOSVersion(String? value) {
    _iOSVersion = value;
    notifyListeners();
  }

  version() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    if (Platform.isAndroid) {
      androidVersion = _prefs.getString('androidVersion');
      print('sini androidVersion $androidVersion');
    } else if (Platform.isIOS) {
      iOSVersion = _prefs.getString('iOSVersion');
    }
  }

  // guna dekat page single_product_page
  Future getProfile() async {
    try {
      _isLoading = true;
      final response = await _profileRepo.getProfile('');

      if (response != null) {
        _profileList = response;
      }
    } catch (e) {
      _profileList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // guna dekat page single_product_page
  Future getPremisOrderDetails(String premisId) async {
    try {
      _isLoading = true;
      final response = await _premisRepo.getPremisOrderDetails(premisId);

      if (response != null) {
        _premisOrderDetails = response;
      }
    } catch (e) {
      _premisOrderDetails = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // guna dekat page single_product_page
  Future getProductOrderDetails(String productId, String premisId) async {
    try {
      _isLoading = true;
      final response =
          await _productsRepo.getProductOrderDetails(productId, premisId);

      if (response != null) {
        _productOrderDetails = response;
      }
    } catch (e) {
      _productOrderDetails = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // guna dekat page choose_premis
  Future getPremisAll() async {
    try {
      _isLoading = true;
      final response = await _premisRepo.getPremisAll();

      if (response != null) {
        _premisAll = response;
      }
    } catch (e) {
      _premisAll = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future deleteOrder(BuildContext context, String premisId) async {
    try {
      final response = await _cartRepo.deleteOrder(orderId![0].id!);
    } finally {
      AppRoute.push(
          context,
          HaddadMallPage(
            premisId: premisId,
          ));
      notifyListeners();
    }
  }

  // guna dekat page choose_premis
  Future getOrderIdWithPremis(String premisId) async {
    try {
      _isLoading = true;
      final response = await _productsRepo.getOrderIdWithPremis(premisId);

      if (response != null) {
        _orderId = response;
      }
    } catch (e) {
      _orderId = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //page haddad_mall_page
  Future getProducts(String premisId) async {
    try {
      _isLoading = true;
      final response = await _productsRepo.getProducts(premisId);

      if (response != null) {
        _productsList = response;
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getSetting() async {
    try {
      _isLoading = true;
      final response = await _productsRepo.getSetting();

      if (response != null) {
        _setting = response;
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // guna dekat page single_product_page
  Future getSingleProduct(String idProduct) async {
    try {
      _isLoading = true;
      final response = await _productsRepo.getSingleProduct(idProduct);

      if (response != null) {
        _singleProductList = response;
      }
    } catch (e) {
      _singleProductList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future firstCheckList(BuildContext context, String premisId, String productId,
      String saleType) async {
    try {
      _isLoading = true;

      if (orderIdList != null) {
        // ^ check dulu ada dak order untuk profile ni (table order)
        print('orderIdList != null');
        if (orderListWithPremisId != null) {
          print('orderListWithPremisId != null');
          // ^ lepastu check order untuk profile ni ada dak order untuk premis yang di pilih
          if (orderId != null) {
            print('orderId != null');
            // ^ check orderId (guna untuk sementara), guna profile id dengan premis id
            if (orderDetails != null) {
              print('orderDetails != null');
              // ^ check ada dak product ni dalam order details

              await updateProductQuantityList(
                  context, premisId, productId, orderDetails![0].id!);
              await getSubTotalList();
              await updateSubTotalList(context);
            } else {
              print('orderDetails == null');
              // ^ kalau orderDetails == null, buat order baru

              await postOrderDetailsList(context, premisId, productId);
              await getSubTotalList();
              await updateSubTotalList(context);
            }
          } else {
            print('orderId == null');
            // ^ kalau orderId (guna untuk sementara) == null, buat order baru

            await postOrderList(
                context, premisId, saleType); // post ke db order baru
            await getOrderIdWithPremis(
                premisId); // get order id guna premisId dengan profileId
            await postOrderDetailsList(
                context, premisId, productId); // post guna orderId
            await getSubTotalList(); // get subtotal untuk order ni
            await updateSubTotalList(
                context); // update subtotal untuk order ni dekat table order
          }
        } else {
          print('orderListWithPremisId == null');
          // ^ kalau orderListWithPremisId == null, buat order baru

          await postOrderList(
              context, premisId, saleType); // post ke db order baru
          await getOrderIdWithPremis(
              premisId); // get order id guna premisId dengan profileId
          await postOrderDetailsList(
              context, premisId, productId); // post guna orderId
          await getSubTotalList(); // get subtotal untuk order ni
          await updateSubTotalList(
              context); // update subtotal untuk order ni dekat table order

        }
      } else {
        print('orderIdList == null');
        // ^ kalau orderIdList == null, buat order baru

        await postOrderList(
            context, premisId, saleType); // post ke db order baru
        await getOrderIdWithPremis(
            premisId); // get order id guna premisId dengan profileId
        await postOrderDetailsList(
            context, premisId, productId); // post guna orderId
        await getSubTotalList(); // get subtotal untuk order ni
        await updateSubTotalList(
            context); // update subtotal untuk order ni dekat table order
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // guna dekat page single_product_page
  Future firstCheck(BuildContext context, String premisId, String productId,
      String saleType) async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      if (order == null) {
        _prefs.remove('orderId'); // remove dulu orderId yang lama
        await postOrder(
            context, premisId, saleType); // dalam ni set orderId yang baru
        await postOrderDetails(context, premisId, productId);
        await getSubTotal();
        await updateSubTotal(context);
      } else {
        if (orderDetails != null) {
          await updateProductQuantity(
              context, premisId, productId, orderDetails![0].id!);
          await getSubTotal();
          await updateSubTotal(context);
        } else {
          await postOrderDetails(context, premisId, productId);
          await getSubTotal();
          await updateSubTotal(context);
        }
      }
    } finally {
      notifyListeners();
    }
  }

  // guna dekat page single_product_page
  Future firstCheckListBaru(BuildContext context, String premisId,
      String productId, String saleType) async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      if (order != null) {
        print('order ada');
        if (premisOrderDetails != null) {
          print('premisOrderDetails ada');
          if (productOrderDetails != null) {
            print('productOrderDetails ada');
            await updateProductQuantity(
                context, premisId, productId, productOrderDetails![0].id!);
            await getSubTotal();
            await updateSubTotal(context);
            // update quantity
          } else {
            // post orderDetails baru
            print('productOrderDetails tada');
            await postOrderDetails(context, premisId, productId);
            await getSubTotal();
            await updateSubTotal(context);
          }
        } else {
          // post orderDetails baru
          print('premisOrderDetails tada');
          await postOrderDetails(context, premisId, productId);
          await getSubTotal();
          await updateSubTotal(context);
        }
      } else {
        // post order baru, table order
        print('order tada');
        _prefs.remove('orderId'); // remove dulu orderId yang lama
        await postOrder(
            context, premisId, saleType); // dalam ni set orderId yang baru
        await postOrderDetails(context, premisId, productId);
        await getSubTotal();
        await updateSubTotal(context);
      }
    } finally {
      notifyListeners();
    }
  }

  // guna dekat page single_product_page
  Future getOrders() async {
    try {
      _isLoading = true;
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      final response = await _ordersRepo.getOrders();

      if (response != null) {
        _order = response;
        _prefs.setString('orderId', _order![0].id!);
      }
    } catch (e) {
      _order = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //1. getOrderIdList()
  //2. getOrderListWithPremisId()

  // guna dekat page single_product_page
  Future getOrderIdList(String premisId) async {
    try {
      _isLoading = true;
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      final response = await _ordersRepo.getOrderIdList();

      if (response != null) {
        _orderIdList = response;
      }
    } catch (e) {
      _orderIdList = null;
      print('orderIdList null');
    } finally {
      _isLoading = false;

      await addOrderId(premisId);
      // await getOrderListWithPremisId(premisId);

      notifyListeners();
    }
  }

  Future addOrderId(String premisId) async {
    List<String> orderIdAdd = [];
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      for (int i = 0; i < _orderIdList!.length; i++) {
        orderIdAdd.add('${_orderIdList![i].id!}');
        print('cuba sinii $orderIdAdd');
        _prefs.setString('orderIdList', '${textSelect(orderIdAdd.toString())}');
      }

      // textSelect(orderIdAdd.toString());

      print('order id list ${_prefs.getString('orderIdList')}');
    } catch (e) {
      print('error sini $e');
    } finally {
      await getOrderListWithPremisId(
          premisId, '${textSelect(orderIdAdd.toString())}');
      notifyListeners();
    }
  }

  // guna dekat page single_product_page
  Future getOrderListWithPremisId(String premisId, String orderIdList) async {
    try {
      _isLoading = true;
      final response =
          await _ordersRepo.getOrderListWithPremisId(premisId, orderIdList);

      if (response != null) {
        _orderListWithPremisId = response;
      }
    } catch (e) {
      _orderListWithPremisId = null;
      print('error getOrderListWithPremisId $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  textSelect(String orderId) {
    orderId = orderId.replaceAll(' ', '');
    orderId = orderId.replaceAll('[', '');
    orderId = orderId.replaceAll(']', '');

    return orderId;
  }

  // guna dekat page single_product_page
  Future getOrdersDetails(String productId) async {
    try {
      _isLoading = true;

      final response = await _ordersRepo.getOrderDetailsId(productId);

      if (response != null) {
        _orderDetails = response;
      }
    } catch (e) {
      _orderDetails = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // guna dekat page single_product_page
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

  // guna dekat page single_product_page
  Future getSubTotalList() async {
    try {
      _isLoading = true;

      final response = await _ordersRepo.getSubTotalList(orderId![0].id!);

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

  // guna dekat page single_product_page
  Future postOrder(
      BuildContext context, String premisId, String saleType) async {
    try {
      _isLoading = true;

      SharedPreferences _prefs = await SharedPreferences.getInstance();
      String? bearerToken = _prefs.getString('BearerToken');

      if (bearerToken != null) {
        final response = await _ordersRepo.postOrders(
            premisId,
            profileList![0].alamat!,
            profileList![0].alamat2!,
            profileList![0].alamat3!,
            profileList![0].bandar!,
            profileList![0].poskod!,
            profileList![0].noTel!,
            profileList![0].pilihanDaerah!,
            profileList![0].pilihanNegeri!,
            saleType);

        if (response != null) {
          _prefs.setString('orderId', response['id']);
        }
      } else {
        final response = await _ordersRepo.postOrders(
            premisId, '', '', '', '', '', '', '', '', saleType);

        if (response != null) {
          _prefs.setString('orderId', response['id']);
        }
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // guna dekat page single_product_page
  Future postOrderList(
      BuildContext context, String premisId, String saleType) async {
    try {
      _isLoading = true;

      SharedPreferences _prefs = await SharedPreferences.getInstance();

      final response = await _ordersRepo.postOrdersList(
          premisId,
          profileList![0].alamat!,
          profileList![0].alamat2!,
          profileList![0].alamat3!,
          profileList![0].bandar!,
          profileList![0].poskod!,
          profileList![0].noTel!,
          profileList![0].pilihanDaerah!,
          profileList![0].pilihanNegeri!,
          saleType);

      if (response != null) {
        _prefs.setString('orderId', response['id']);
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // guna dekat page single_product_page
  Future postOrderDetails(
      BuildContext context, String premisId, String productId) async {
    try {
      _isLoading = true;

      final response = await _ordersRepo.postOrderDetails(
          premisId, productId, quantity.toString(), price.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // guna dekat page single_product_page
  Future postOrderDetailsList(
      BuildContext context, String premisId, String productId) async {
    try {
      _isLoading = true;

      final response = await _ordersRepo.postOrderDetailsList(premisId,
          productId, quantity.toString(), price.toString(), orderId![0].id!);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // guna dekat page single_product_page
  Future updateProductQuantity(BuildContext context, String premisId,
      String productId, String orderDetailsId) async {
    try {
      _isLoading = true;

      final response = await _ordersRepo.updateProductQuantity(
          premisId,
          productId,
          int.parse(productOrderDetails![0].kuantiti!) + quantity,
          double.parse(productOrderDetails![0].harga!) + price!,
          orderDetailsId);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // guna dekat page single_product_page
  Future updateProductQuantityList(BuildContext context, String premisId,
      String productId, String orderDetailsId) async {
    try {
      _isLoading = true;

      final response = await _ordersRepo.updateProductQuantityList(
          premisId,
          productId,
          int.parse(orderDetails![0].kuantiti!) + quantity,
          double.parse(orderDetails![0].harga!) + price!,
          orderDetailsId);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future updateSubTotal(BuildContext context) async {
    try {
      _isLoading = true;

      final response = await _ordersRepo.updateSubTotal(
          orderSubTotal![0].sumHarga!, setting![0].value!);

      if (response != null) {
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: Colors.transparent,
              child: AppAlertDialog(
                alertDialogType: AlertDialogType.success,
                title: "Congratulation",
                subtitle: '',
                description: "Products added to your cart",
                actionButtons: [
                  ActionButton(
                    label: 'Back',
                    color: secondaryColor,
                    onTap: () {
                      AppRoute.pop(context);
                      AppRoute.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future updateSubTotalList(BuildContext context) async {
    try {
      _isLoading = true;

      final response = await _ordersRepo.updateSubTotalList(
          orderSubTotal![0].sumHarga!, setting![0].value!, orderId![0].id!);

      if (response != null) {
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: Colors.transparent,
              child: AppAlertDialog(
                alertDialogType: AlertDialogType.success,
                title: "Congratulation",
                subtitle: '',
                description: "Products added to your cart",
                actionButtons: [
                  ActionButton(
                    label: 'Back',
                    color: secondaryColor,
                    onTap: () {
                      AppRoute.pop(context);
                      AppRoute.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  getAll(String idProduct, String premisId) async {
    await getProfile();
    await getSingleProduct(idProduct);
    await getOrders();
    await getOrdersDetails(idProduct);
    price = double.parse(singleProductList![0].harga!);
  }

  getAllList(String idProduct, String premisId) async {
    await getProfile();
    await getSingleProduct(idProduct);

    await getOrderIdList(premisId);
    // await getOrderListWithPremisId(premisId);
    await getOrderIdWithPremis(premisId);
    await getOrdersDetails(idProduct);

    price = double.parse(singleProductList![0].harga!);
  }

  getAllListBaru(String idProduct, String premisId) async {
    await getProfile();
    await getSingleProduct(idProduct);

    await getOrders();
    await getPremisOrderDetails(premisId);
    await getProductOrderDetails(idProduct, premisId);

    price = double.parse(singleProductList![0].harga!);
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

  Future getPayment() async {
    try {
      _isLoading = true;
      await getToyyibKey();
      await getCatCode();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
