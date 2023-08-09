import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class TransactionState extends ChangeNotifier {
  final _transactionRepo = TransactionRepository();
  final _orderRepo = OrdersRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Orders1>? _transaction;
  List<Orders1>? get transaction => _transaction;

  List<OrderDetailsAll>? _orderDetails;
  List<OrderDetailsAll>? get orderDetails => _orderDetails;

  Future getTransaction() async {
    try {
      _isLoading = true;

      final response = await _transactionRepo.getTransaction();

      if (response != null) {
        _transaction = response;
      }
    } catch (e) {
      _transaction = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getOrderDetails(String orderId) async {
    try {
      _isLoading = true;

      final response = await _orderRepo.getOrderDetails(orderId);

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
}
