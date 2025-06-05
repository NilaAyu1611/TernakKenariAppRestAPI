import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:canarry_app1/services/service_http_client.dart ';

class AuthRepository {
  final ServiceHttpClient _ServiceHttpClient;
  final secureStorage = FlutterSecureStorage();
  
  AuthRepository(this._ServiceHttpClient);
}