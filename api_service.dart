import 'dart:developer';
import 'package:http/http.dart' as http;
import 'user_model.dart';
import 'constants.dart';

class ApiService {
  Future<List<UserModel>?> getUsers() async { //we add '?' because it could be non-nullable
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.usersEndPoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<UserModel>?> getTodos() async { //we add '?' because it could be non-nullable
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.todosEndPoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}