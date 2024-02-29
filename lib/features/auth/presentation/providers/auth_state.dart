
import '../../data/user.dart';

enum AuthStatus {
  loading,
  authenticated,
  unauthenticated,
}

class AuthState {
  final AuthStatus authStatus;
  final String? authKey;
  final User? user;

  AuthState({
    required this.authStatus,
    this.authKey,
    this.user,
  });

  AuthStatus get currentAuthStatus => authStatus;

  factory AuthState.empty() {
    return AuthState(authStatus: AuthStatus.unauthenticated);
  }
  factory AuthState.reset(AuthStatus authStatus) {
    return AuthState(authStatus: authStatus, user: null, authKey: null);
  }

  AuthState copyWith({
    AuthStatus? authStatus,
    String? authKey,
    User? user,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      authKey: authKey ?? this.authKey,
      user: user ?? this.user,
    );
  }
}
