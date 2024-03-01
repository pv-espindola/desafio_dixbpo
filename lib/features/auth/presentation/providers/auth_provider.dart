import 'dart:async';
import 'dart:convert';
import 'package:desafio_dixbpo/features/auth/data/auth_token.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../service/api_service.dart';
import '../../data/user.dart';
import '../../domain/auth_repository.dart';
import 'auth_state.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepository authRepository;

  AuthProvider({
    required this.authRepository,
  });

  AuthState _state = AuthState.empty();

  AuthState get state => _state;

  String get myID => state.user!.id.toString();
  GlobalKey<FormState> formKey = GlobalKey();
  String _email = '';
  String _password ='';

  void loadEmail(String email) => _email = email;
  void loadPassword(String password) => _password = password;

  void update(User? user) {
    if (user != null) {
      _state = _state.copyWith(
        authStatus: AuthStatus.authenticated,
        user: user,
      );
    } else {
      _state = _state.copyWith(authStatus: AuthStatus.unauthenticated);
    }
    notifyListeners();
  }

  void setAuthState({
    AuthStatus? status,
    String? authKey,
    User? user,
  }) {
    _state = _state.copyWith(
      authStatus: status ?? _state.authStatus,
      authKey: authKey ?? _state.authKey,
      user: user ?? _state.user,
    );
    notifyListeners();
  }

  bool get isAuthenticated {
    if (_state.currentAuthStatus == AuthStatus.authenticated &&
        _state.user != null) return true;

    return false;
  }

  /// Sign the user out and clear all local credentials. Accepts an [AuthStatus]
  /// with either `unauthenticated` or `justLoggedOut` to set the logged out
  /// status (defaults to [AuthStatus.justLoggedOut]).
  Future<void> signOut({
    AuthStatus authStatus = AuthStatus.unauthenticated,
    testing = false,
  }) async {
    try {
      await authRepository.signOut();
      _state = AuthState.reset(authStatus);
      notifyListeners();
      debugPrint('${_state.currentAuthStatus} in provider');
    } catch (e) {
      debugPrint('authStatus:  $e');
    }
  }

  Future<void> login() async {
    setAuthState(status: AuthStatus.loading);
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
    }
    try {
      print('email: $_email  password: $_password ');

      User user = await authRepository.login(_email, _password);

      setAuthState(status: AuthStatus.authenticated, user: user);
    } catch (e) {
      setAuthState(status: AuthStatus.unauthenticated);
      debugPrint('LOGIN ERROR:  $e');
    }
  }

  /// Checks if user is stored locally. If so, get it, update the state and
  /// trigger an asynchronous request in order to update latest user information
  /// in the background. If there's no user information locally, force sign out.
  Future<void> tryAutoSignin(SharedPreferences prefs,
      {bool testing = false}) async {
    setAuthState(status: AuthStatus.loading);
    final userData = prefs.getString('user_data');
    final authKey = prefs.getString('token');

    AuthToken authToken = authRepository.authToken;

    try {
      if (authToken.haveAccess) {
        // Get user data from local storage immediately.
        final user = User.fromMap(authToken.userData);

        setAuthState(
          status: AuthStatus.authenticated,
          authKey: authToken.token,
          user: user,
        );

        // Asynchronously trigger a request to get the latest user data.
        updateCurrentUser(user, authKey);
      } else {
        signOut(authStatus: AuthStatus.unauthenticated);
      }
    } catch (_) {
      signOut(authStatus: AuthStatus.unauthenticated);
    }
  }

  /// Get the currently authenticated user data from the server and set the
  /// state with the new user data.
  Future<void> updateCurrentUser(User user, String? authKey) async {
    try {

      setAuthState(
        status: AuthStatus.authenticated,
        authKey: authKey,
        user: user,
      );
    } catch (e) {
      // If something wrong happens on getting the user data, force sign out.
      debugPrint('Error updating user: $e');
      signOut(authStatus: AuthStatus.unauthenticated);
    }
  }
}
