import 'package:http/http.dart';
import '../core/remote_url.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  setLoad(value) {
    _loading = value;
    notifyListeners();
  }

  bool _toggle = false;

  bool get toggle => _toggle;

  void setToggle() {
    _toggle = !_toggle;
    notifyListeners();
  }

  void login(String email, String password) async {
    try {
      setLoad(true);
      Response response = await post(Uri.tryParse(login_url)!,
          body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Logged in successfully.",
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 12.0,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Failed to logged in.",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 12.0,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 12.0,
      );
    } finally {
      setLoad(false);
    }
  }
}
