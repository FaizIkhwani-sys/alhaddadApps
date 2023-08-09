import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:image/image.dart';
import 'dart:typed_data';
// import 'package:flutter/services.dart' ;
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class TryState extends ChangeNotifier with TextControllerMixin {
  final _receiptRepo = ReceiptRepository();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _firebaseToken;
  String? get firebaseToken => _firebaseToken;
  set firebaseToken(String? value) {
    _firebaseToken = value;
    notifyListeners();
  }

  String? _kitchenIP;
  String? get kitchenIP => _kitchenIP;
  set kitchenIP(String? value) {
    _kitchenIP = value;
    validateKitchenIP();
    notifyListeners();
  }

  String? _counterIP;
  String? get counterIP => _counterIP;
  set counterIP(String? value) {
    _counterIP = value;
    validateCounterIP();
    notifyListeners();
  }

  String? _kitchenPort;
  String? get kitchenPort => _kitchenPort;
  set kitchenPort(String? value) {
    _kitchenPort = value;
    validateKitchenPort();
    notifyListeners();
  }

  String? _counterPort;
  String? get counterPort => _counterPort;
  set counterPort(String? value) {
    _counterPort = value;
    validateCounterPort();
    notifyListeners();
  }

  String? _IPServerOffline;
  String? get IPServerOffline => _IPServerOffline;
  set IPServerOffline(String? value) {
    _IPServerOffline = value;
    notifyListeners();
  }

  String? _bearerToken;
  String? get bearerToken => _bearerToken;
  set bearerToken(String? value) {
    _bearerToken = value;
    notifyListeners();
  }

  String _counterIPError = '';
  String get counterIPError => _counterIPError;
  bool get counterIPHasError => !_counterIPError.isNullOrWhiteSpace;

  String _counterPortError = '';
  String get counterPortError => _counterPortError;
  bool get counterPortHasError => !_counterPortError.isNullOrWhiteSpace;

  String _kitchenIPError = '';
  String get kitchenIPError => _kitchenIPError;
  bool get kitchenIPHasError => !_kitchenIPError.isNullOrWhiteSpace;

  String _kitchenPortError = '';
  String get kitchenPortError => _kitchenPortError;
  bool get kitchenPortHasError => !_kitchenPortError.isNullOrWhiteSpace;

  List<Premis>? _premisById;
  List<Premis>? get premisById => _premisById;

  List<Orders1>? _orderById;
  List<Orders1>? get orderById => _orderById;

  List<OrderDetailsAll>? _orderDetailsById;
  List<OrderDetailsAll>? get orderDetailsById => _orderDetailsById;

  function() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    firebaseToken = _prefs.getString('firebaseToken');
    bearerToken = _prefs.getString('BearerToken');
  }

  void validateKitchenIP() {
    try {
      _kitchenIPError = '';
      if (kitchenIP.isNullOrWhiteSpace) {
        _kitchenIPError = '*required';
        return;
      }
      if (!kitchenIP.isIP) {
        _kitchenIPError = 'IP is invalid';
        return;
      }
    } finally {
      notifyListeners();
    }
  }

  void validateCounterIP() {
    try {
      _counterIPError = '';
      if (counterIP.isNullOrWhiteSpace) {
        _counterIPError = '*required';
        return;
      }
      if (!counterIP.isIP) {
        _counterIPError = 'IP is invalid';
        return;
      }
    } finally {
      notifyListeners();
    }
  }

  void validateCounterPort() {
    try {
      _counterPortError = '';
      if (counterPort.isNullOrWhiteSpace) {
        _counterPortError = '*required';
        return;
      }
      if (!counterPort.isPortNumber) {
        _counterPortError = 'Port is invalid';
        return;
      }
    } finally {
      notifyListeners();
    }
  }

  void validateKitchenPort() {
    try {
      _kitchenPortError = '';
      if (kitchenPort.isNullOrWhiteSpace) {
        _kitchenPortError = '*required';
        return;
      }
      if (!kitchenPort.isPortNumber) {
        _kitchenPortError = 'Port is invalid';
        return;
      }
    } finally {
      notifyListeners();
    }
  }

  validateAll() {
    validateCounterIP();
    validateCounterPort();
    validateKitchenIP();
    validateKitchenPort();
  }

  void testReceipt2(NetworkPrinter printer) async {
    // print("hui1");
    // final ByteData data = await rootBundle.load('assets/logo_alhaddad.jpg');
    // final Uint8List bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    // final Image? image = decodeImage(bytes);
    // printer.image("assets/logo_alhaddad.jpg");
    // // printer.imageRaster(image!);
    // printer.imageRaster(image!, imageFn: PosImageFn.graphics);
    printer.text('${premisById![0].namaPremis} ',
        styles: PosStyles(
          align: PosAlign.center,
          height: PosTextSize.size2,
          width: PosTextSize.size2,
        ),
        linesAfter: 1);

    // Alamat premis tgk line alamat yg x null... tambah extra line
    printer.text('${premisById![0].alamat},',
        styles: PosStyles(align: PosAlign.center));
    printer.text('${premisById![0].alamat2},',
        styles: PosStyles(align: PosAlign.center));
    printer.text('${premisById![0].bandar}',
        styles: PosStyles(align: PosAlign.center));
    printer.text('Tel: ${premisById![0].noTel}',
        styles: PosStyles(align: PosAlign.center), linesAfter: 1);
    printer.hr();
    printer.text('Nama Cashier: ${orderById![0].namaPenuh}',
        styles: PosStyles(align: PosAlign.left), linesAfter: 1);
    printer.text(
      'IDOrder: ${orderById![0].id}',
      styles: PosStyles(align: PosAlign.left),
    );
    printer.hr();

    printer.row([
      PosColumn(text: 'Qty', width: 1),
      PosColumn(text: 'Brg', width: 7),
      PosColumn(
          text: 'Harga', width: 2, styles: PosStyles(align: PosAlign.right)),
      PosColumn(
          text: 'Jumlah', width: 2, styles: PosStyles(align: PosAlign.right)),
    ]);

    // loop dari orderDetails
    for (int i = 0; i < orderDetailsById!.length; i++) {
      // _totalSST = _totalSST +  double.parse("${orderDetailsById![0].sst}");
      // _cukaiPerkhitmatan = _cukaiPerkhitmatan +  double.parse("${orderDetailsById![0].servisCaj}");
      printer.row([
        PosColumn(text: '${orderDetailsById![i].kuantiti}', width: 1),
        PosColumn(text: '${orderDetailsById![i].name}', width: 7),
        PosColumn(
            text: '${orderDetailsById![i].hargaAsal}',
            width: 2,
            styles: PosStyles(align: PosAlign.right)),
        PosColumn(
            text: '${double.parse("${orderDetailsById![i].jumlahHarga}")}0',
            width: 2,
            styles: PosStyles(align: PosAlign.right)),
      ]);
      if (orderDetailsById![i].addOn != null ||
          orderDetailsById![i].addOn != " ") {
        String addOn = orderDetailsById![i].addOn!;
        String addOnHarga = orderDetailsById![i].addOnHarga!;
        final splittedAddOn = addOn.split(',');
        final splittedAddOnHarga = addOnHarga.split(',');
        for (int i = 0; i < splittedAddOn.length; i++) {
          printer.row([
            PosColumn(text: ' ', width: 1),
            PosColumn(text: '${splittedAddOn[i]}', width: 7),
            PosColumn(
                text: '${splittedAddOnHarga[i]}',
                width: 2,
                styles: PosStyles(align: PosAlign.right)),
            PosColumn(
                text: ' ', width: 2, styles: PosStyles(align: PosAlign.right)),
          ]);
        }
      }
    }
    printer.hr();
    printer.row([
      PosColumn(text: 'Cukai (SST)', width: 8),
      PosColumn(
          text: '${orderById![0].cukai}',
          width: 4,
          styles: PosStyles(align: PosAlign.right)),
    ]);

    printer.row([
      PosColumn(text: 'Cukai Perkhidmatan', width: 8),
      PosColumn(
          text: '${orderById![0].cukaiPerkhidmatan}',
          width: 4,
          styles: PosStyles(align: PosAlign.right)),
    ]);

    printer.hr();

    //grandtotal
    printer.row([
      PosColumn(
          text: 'JUMLAH',
          width: 6,
          styles: PosStyles(
            height: PosTextSize.size2,
            width: PosTextSize.size2,
          )),
      PosColumn(
          text: '${orderById![0].grandTotal}',
          width: 6,
          styles: PosStyles(
            align: PosAlign.right,
            height: PosTextSize.size2,
            width: PosTextSize.size2,
          )),
    ]);

    printer.hr(ch: '=', linesAfter: 1);

    //cash given
    printer.row([
      PosColumn(
          text: 'Bayar: ',
          width: 8,
          styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2)),
      PosColumn(
          text: '${orderById![0].cashGiven}',
          width: 4,
          styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2)),
    ]);
    printer.row([
      PosColumn(
          text: 'Baki: ',
          width: 8,
          styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2)),
      PosColumn(
          text: '${orderById![0].balanceGiven}',
          width: 4,
          styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2)),
    ]);
    //cara bayaran
    printer.row([
      PosColumn(
          text: 'Cara Bayaran: ',
          width: 8,
          styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2)),
      PosColumn(
          text: '${orderById![0].caraBayaran}',
          width: 4,
          styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2)),
    ]);

    printer.feed(2);
    printer.text('Terima kasih!',
        styles: PosStyles(align: PosAlign.center, bold: true));

    printer.text('${DateTime.now()}',
        styles: PosStyles(align: PosAlign.center), linesAfter: 2);

    // Print QR Code from image
    // try {
    //   const String qrData = 'example.com';
    //   const double qrSize = 200;
    //   final uiImg = await QrPainter(
    //     data: qrData,
    //     version: QrVersions.auto,
    //     gapless: false,
    //   ).toImageData(qrSize);
    //   final dir = await getTemporaryDirectory();
    //   final pathName = '${dir.path}/qr_tmp.png';
    //   final qrFile = File(pathName);
    //   final imgFile = await qrFile.writeAsBytes(uiImg.buffer.asUint8List());
    //   final img = decodeImage(imgFile.readAsBytesSync());

    //   printer.image(img);
    // } catch (e) {
    //   print(e);
    // }

    // Print QR Code using native function
    // printer.qrcode('example.com');

    printer.feed(2);
    printer.cut();
  }

  void testOrderKitchen(NetworkPrinter printer) async {
    // Print image
    // final ByteData data = await rootBundle.load('assets/images/1.jpg');
    // final Uint8List bytes = data.buffer.asUint8List();
    // final Image? image = decodeImage(bytes);
    // printer.image(image!);

    printer.text('${premisById![0].namaPremis}',
        styles: PosStyles(
          align: PosAlign.center,
          height: PosTextSize.size2,
          width: PosTextSize.size2,
        ),
        linesAfter: 1);

    // Alamat premis tgk line alamat yg x null... tambah extra line

    printer.text('IDOrder: ${orderById![0].id}',
        styles: PosStyles(
          align: PosAlign.center,
          height: PosTextSize.size2,
          width: PosTextSize.size2,
        ),
        linesAfter: 1);

    printer.row([
      PosColumn(text: 'Brg', width: 6),
      PosColumn(text: 'Qty', width: 6),
    ]);
    printer.hr();

    // loop dari orderDetails
    for (int i = 0; i < orderDetailsById!.length; i++) {
      if (orderDetailsById![i].kitchen == "1") {
        printer.row([
          PosColumn(text: '${orderDetailsById![i].name}', width: 6),
          PosColumn(text: '${orderDetailsById![i].kuantiti}', width: 6),
        ]);
      }
      if (orderDetailsById![i].addOn != null ||
          orderDetailsById![i].addOn != " ") {
        String addOn = orderDetailsById![i].addOn!;
        String addOnHarga = orderDetailsById![i].addOnHarga!;
        final splittedAddOn = addOn.split(',');
        for (int i = 0; i < splittedAddOn.length; i++) {
          printer.row([
            PosColumn(text: ' ', width: 1),
            PosColumn(text: '${splittedAddOn[i]}', width: 7),
            PosColumn(
                text: ' ', width: 2, styles: PosStyles(align: PosAlign.right)),
            PosColumn(
                text: ' ', width: 2, styles: PosStyles(align: PosAlign.right)),
          ]);
        }
      }
      // _totalSST = _totalSST +  double.parse("${orderDetailsById![0].sst}");
      // _cukaiPerkhitmatan = _cukaiPerkhitmatan +  double.parse("${orderDetailsById![0].servisCaj}");

    }

    printer.feed(2);
    printer.cut();
  }

  void testReceipt(NetworkPrinter printer) async {
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm80, profile);
    List<int> bytes = [];

    bytes += generator.text(
        'Regular: aA bB cC dD eE fF gG hH iI jJ kK lL mM nN oO pP qQ rR sS tT uU vV wW xX yY zZ');
    bytes += generator.text('Special 1: àÀ èÈ éÉ ûÛ üÜ çÇ ôÔ',
        styles: PosStyles(codeTable: 'CP1252'));
    bytes += generator.text('Special 2: blåbærgrød',
        styles: PosStyles(codeTable: 'CP1252'));

    bytes += generator.text('Bold text', styles: PosStyles(bold: true));
    bytes += generator.text('Reverse text', styles: PosStyles(reverse: true));
    bytes += generator.text('Underlined text',
        styles: PosStyles(underline: true), linesAfter: 1);
    bytes +=
        generator.text('Align left', styles: PosStyles(align: PosAlign.left));
    bytes += generator.text('Align center',
        styles: PosStyles(align: PosAlign.center));
    bytes += generator.text('Align right',
        styles: PosStyles(align: PosAlign.right), linesAfter: 1);

    bytes += generator.row([
      PosColumn(
        text: 'col3',
        width: 3,
        styles: PosStyles(align: PosAlign.center, underline: true),
      ),
      PosColumn(
        text: 'col6',
        width: 6,
        styles: PosStyles(align: PosAlign.center, underline: true),
      ),
      PosColumn(
        text: 'col3',
        width: 3,
        styles: PosStyles(align: PosAlign.center, underline: true),
      ),
    ]);

    bytes += generator.text('Text size 200%',
        styles: PosStyles(
          height: PosTextSize.size2,
          width: PosTextSize.size2,
        ));

    // Print image:
    final ByteData data = await rootBundle.load('assets/images/1.gif');
    final Uint8List imgBytes = data.buffer.asUint8List();
    // final Image image = !;
    bytes += generator.image(decodeImage(imgBytes)!);
    printer.text(bytes.toString());
    // Print image using an alternative (obsolette) command
    // bytes += generator.imageRaster(image);

    // Print barcode
    final List<int> barData = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 4];
    bytes += generator.barcode(Barcode.upcA(barData));

    // Print mixed (chinese + latin) text. Only for printers supporting Kanji mode
    // ticket.text(
    //   'hello ! 中文字 # world @ éphémère &',
    //   styles: PosStyles(codeTable: PosCodeTable.westEur),
    //   containsChinese: true,
    // );

    bytes += generator.feed(2);
    bytes += generator.cut();
  }

  getReceiptDetails() async {
    _isLoading = true;
    print("1");
    await getOrderById();
    print("2");
    await getPremisById();
    print("3");
    await getOrderDetails();
    print("4");
    counterPrinter2();
    print("5");
    for (int i = 0; i < orderDetailsById!.length; i++) {
      if (orderDetailsById![i].kitchen == '1') {
        kitchenPrinter2();
      }
    }
    _isLoading = false;
  }

  getReceiptDetailsOffline() async {
    _isLoading = true;
    print("1");
    await getOrderByIdOffline();
    print("2");
    await getPremisByIdOffline();
    print("3");
    await getOrderDetailsOffline();
    print("4");
    counterPrinter2();
    for (int i = 0; i < orderDetailsById!.length; i++) {
      if (orderDetailsById![i].kitchen == '1') {
        kitchenPrinter2();
      }
    }
    _isLoading = false;
  }

  getPremisById() async {
    try {
      print("idPremis: ${orderById![0].premisId!}");
      final response = await _receiptRepo.getPremis(orderById![0].premisId!);
      if (response != null) {
        _premisById = response;
      }
    } catch (e) {
      _premisById = null;
    } finally {
      notifyListeners();
    }
  }

  getOrderById() async {
    try {
      final response = await _receiptRepo.getOrders();
      if (response != null) {
        _orderById = response;
      }
    } catch (e) {
      _orderById = null;
      print("Saya rosak");
    } finally {
      notifyListeners();
    }
  }

  getOrderDetails() async {
    try {
      final response = await _receiptRepo.getOrderDetails();
      if (response != null) {
        _orderDetailsById = response;
      }
    } catch (e) {
      _orderDetailsById = null;
    } finally {
      notifyListeners();
    }
  }

  getPremisByIdOffline() async {
    try {
      print("idPremis: ${orderById![0].premisId!}");
      final response =
          await _receiptRepo.getPremisOffline(orderById![0].premisId!);
      if (response != null) {
        _premisById = response;
      }
    } catch (e) {
      _premisById = null;
    } finally {
      notifyListeners();
    }
  }

  getOrderByIdOffline() async {
    try {
      final response = await _receiptRepo.getOrdersOffline();
      if (response != null) {
        _orderById = response;
      }
    } catch (e) {
      _orderById = null;
      print("Saya rosak");
    } finally {
      notifyListeners();
    }
  }

  getOrderDetailsOffline() async {
    try {
      final response = await _receiptRepo.getOrderDetailsOffline();
      if (response != null) {
        _orderDetailsById = response;
      }
    } catch (e) {
      _orderDetailsById = null;
    } finally {
      notifyListeners();
    }
  }

  printer() async {
    final PaperSize paper = PaperSize.mm80;
    final profile = await CapabilityProfile.load();
    final printer = NetworkPrinter(paper, profile);

    final PosPrintResult res =
        await printer.connect('192.168.0.49', port: 9100);

    if (res == PosPrintResult.success) {
      testReceipt(printer);
      printer.disconnect();
    }

    print('Print result: ${res.msg}');
  }

  counterPrinter2() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final PaperSize paper = PaperSize.mm80;
    final profile = await CapabilityProfile.load();
    final printer = NetworkPrinter(paper, profile);
    final counterIP = _prefs.getString("counterIP");
    print("counterIP : $counterIP");
    final counterPort = int.parse(_prefs.getString("counterPort")!);
    print("counterPort : $counterPort");

    final PosPrintResult res =
        await printer.connect('$counterIP', port: counterPort);
    // await printer.connect('$counterIP', port: 9100);

    if (res == PosPrintResult.success) {
      testReceipt2(printer);
      // testOrderKitchen(printer);
      printer.disconnect();
    }

    print('Print result: ${res.msg}');
  }

  kitchenPrinter2() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final PaperSize paper = PaperSize.mm80;
    final profile = await CapabilityProfile.load();
    final printer = NetworkPrinter(paper, profile);
    final kitchenIP = _prefs.getString("kitchenIP");
    print("kitchenIP : $kitchenIP");
    final kitchenPort = int.parse(_prefs.getString("kitchenPort")!);
    print("kitchenPort : $kitchenPort");

    final PosPrintResult res =
        await printer.connect('$kitchenIP', port: kitchenPort);

    if (res == PosPrintResult.success) {
      // testReceipt2(printer);
      testOrderKitchen(printer);
      printer.disconnect();
    }

    print('Print result: ${res.msg}');
  }

  // connectDevice(PrinterDevice selectedPrinter, PrinterType type,
  //     {bool reconnect = false, bool isBle = false, String? ipAddress}) async {
  //   switch (type) {
  //     // only windows and android
  //     case PrinterType.usb:
  //       await PrinterManager.instance.connect(
  //           type: type,
  //           model: UsbPrinterInput(
  //               name: selectedPrinter.name,
  //               productId: selectedPrinter.productId,
  //               vendorId: selectedPrinter.vendorId));
  //       break;
  //     // only iOS and android
  //     case PrinterType.bluetooth:
  //       await PrinterManager.instance.connect(
  //           type: type,
  //           model: BluetoothPrinterInput(
  //               name: selectedPrinter.name,
  //               address: selectedPrinter.address!,
  //               isBle: isBle,
  //               autoConnect: reconnect));
  //       break;
  //     case PrinterType.network:
  //       await PrinterManager.instance.connect(
  //           type: type,
  //           model: TcpPrinterInput(
  //               ipAddress: ipAddress ?? selectedPrinter.address!));
  //       break;
  //     default:
  //   }
  // }
}
