import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanAndPayState extends ChangeNotifier {
  final _productsRepo = ProductsRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<ProductId>? _productId;
  List<ProductId>? get productId => _productId;

  List<SingleProduct>? _singleProductList;
  List<SingleProduct>? get singleProductList => _singleProductList;

  String? _barcodeScanRes;
  String? get barcodeScanRes => _barcodeScanRes;
  set barcodeScanRes(String? value) {
    _barcodeScanRes = value;
    notifyListeners();
  }

  String _scanBarCode = 'Unknown';
  String get scanBarCode => _scanBarCode;
  set scanBarCode(String value) {
    _scanBarCode = value;
    notifyListeners();
  }

  Future scanBarcodeNormal(BuildContext context) async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print('barcodescanres $barcodeScanRes');

      _scanBarCode = barcodeScanRes!;

      if (scanBarCode != 'Unknown') {
        print('sini jalan $scanBarCode');
        await getAll(context);
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    } finally {
      notifyListeners();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
  }

  Future getAll(BuildContext context) async {
    try {
      print('get all jalan');
      await getProductBarcode(scanBarCode);
      if (productId != null) {
        await getSingleProductScan(productId![0].id!);
        await AppRoute.pushReplacement(
            context,
            SingleProductPage(
              productName: singleProductList![0].name,
              premisId: '1',
              idProduct: singleProductList![0].id,
              saleType: '457',
            ));
      }
    } finally {
      notifyListeners();
    }
  }

  Future getProductBarcode(String barcode) async {
    try {
      _isLoading = true;
      final response = await _productsRepo.getProductBarcode(barcode);

      if (response != null) {
        _productId = response;
        print('get barcode');
      }
    } catch (e) {
      _productId = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getSingleProductScan(String idProduct) async {
    try {
      _isLoading = true;
      final response = await _productsRepo.getSingleProductScan(idProduct);

      if (response != null) {
        _singleProductList = response;
        print('single product');
      }
    } catch (e) {
      _singleProductList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
