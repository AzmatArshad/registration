import 'dart:async';
import 'dart:convert';

import 'package:login/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CustomeUserAuthentication {
  Map<String, dynamic> userData = {
    'userName': '',
    'email': '',
    'isDriver': bool,
  };
  String? idToken;
  String? _userId;
  String? _userEmail;
  String? _userName;
  DateTime? _expiryDate;
  Timer? _authTimer;
  bool? _userConformation;

  String? get userName {
    return _userName;
  }

  String? get userEmail {
    return _userName;
  }

  bool? get isDriver {
    return _userConformation;
  }

  Future<void> authenticate(
      String email, String password, String urlSigment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSigment?key=AIzaSyDLR22c610wLLStYvUuIWeAsUZviq05Zss';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw Exception(responseData['error']['message']);
      }
      idToken = responseData['idToken'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      _userId = responseData['localId'];
    } catch (error) {
      rethrow;
    }
  }

  Future<void> signUp({
    required String userName,
    required String email,
    required String password,
  }) async {
    _userName = userName;
    _userEmail = email;
    _userConformation = isDriver;
    return authenticate(email, password, "signUp");
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    return authenticate(email, password, "signInWithPassword");
  }

  Future<void> saveUserDataInInternalStorage() async {
    final pref = await SharedPreferences.getInstance();
    final userData = json.encode({
      'token': idToken,
      'userId': _userId,
      'expiryDate': _expiryDate!.toIso8601String(),
      'isDriver': _userConformation,
    });
    pref.setString('userData', userData);
  }

  Future<bool> tryAutoLogin() async {
    final pref = await SharedPreferences.getInstance();
    if (!pref.containsKey('userData')) {
      return false;
    }
    final extractedData =
        json.decode(pref.getString('userData')!) as Map<String, dynamic>;

    final expiryDate = DateTime.parse(extractedData['expiryDate']);
    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    idToken = extractedData['token'];
    _userId = extractedData['userId'];
    _userConformation = extractedData['isDriver'];
    _expiryDate = expiryDate;
    return true;
  }

  Future<void> uploadUserDetails() async {
    try {
      if (_userId != null) {
        final url =
            'https://speedo-f1389-default-rtdb.asia-southeast1.firebasedatabase.app/UsersDetails/$_userId.json?auth=$idToken';
        final response = await http.post(
          Uri.parse(url),
          body: json.encode(
            {
              'userName': _userName,
              'email': _userEmail,
              'isDriver': isDriver,
            },
          ),
        );
      }
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  Future<void> gettingUserData() async {
    final url =
        'https://speedo-f1389-default-rtdb.asia-southeast1.firebasedatabase.app/UsersDetails/$_userId.json?auth=$idToken';
    try {
      final response = await http.get(Uri.parse(url));
      if (json.decode(response.body) != null) {
        final extractedItems =
            json.decode(response.body) as Map<String, dynamic>;
        if (response.statusCode == 200) {
          extractedItems.forEach((itemId, itemData) {
            _userName = itemData['userName'];
            _userEmail = itemData['email'];
            _userConformation = itemData['isDriver'];
          });
        }
        print(response.body);
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> logoutUser() async {
    idToken = null;
    _userId = null;
    _expiryDate = null;
    _userConformation = null;
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}
