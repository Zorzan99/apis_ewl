import 'package:get/get.dart';
import 'package:pokeapi/application/Exception/app_exception.dart';
import 'package:pokeapi/models/login/login_model.dart';
import 'package:pokeapi/models/login/login_model_error.dart';
import 'package:pokeapi/models/login/login_succes_model.dart';

class LoginRepository {
  final restClient = GetConnect();

  Future<LoginSuccesModel> postUser(LoginModel loginModel) async {
    print(loginModel.toJson());
    final result = await restClient.post(
      headers: {'Content-Type': 'application/json'},
      'https://apidev.ewally.com.br/user/login',
      loginModel.toJson(),
    );
    print(result.body);
    if (result.statusCode == 200) {
      return LoginSuccesModel.fromMap(result.body);
    } else {
      print('RESULTADO DO BODY ${result.body}');
      final modelError = LoginModelError.fromMap(result.body);
      throw AppException(
        message: modelError.msg,
        code: modelError.code,
      );
    }
  }
}
