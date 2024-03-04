/// A class that maps the API endpoints to static get methods that can be
/// called, which is useful for concentrating the API endpoints in a single
/// place.
class Endpoint {
  // User Authentication
  static String get userLogin => 'auth/login';
  static String get userRegister => 'auth/users';
  static String get listAuctions => 'auctions';

}
