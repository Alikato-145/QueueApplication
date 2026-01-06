import 'package:flutter/material.dart';
import 'package:smart_queue_app/service/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService;

  AuthViewModel(this._authService);

  String? error;

  Future<bool> login(String email, String password) async {
    try {
      await _authService.signInWithEmailPassword(email, password);
      return true;
    } catch (e) {
      error = e.toString();
      notifyListeners();
      return false;
    }
  }
}
