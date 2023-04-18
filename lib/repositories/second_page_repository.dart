import 'package:get/get.dart';
import 'package:pokeapi/application/Exception/app_exception.dart';
import 'package:pokeapi/application/token/token.dart';
import 'package:pokeapi/models/login/login_model_error.dart';
import 'package:pokeapi/models/second_page/second_page_model.dart';

class SecondPageRepository {
  final restClient = GetConnect();

  Future<SecondPageModel> getAccount() async {
    final token = TokenStorage.getToken(); // recupera o token armazenado
    if (token == null) {
      ('Token not found'); // trata o caso em que o token não foi encontrado
    }
    final result = await restClient.get(
      'https://apidev.ewally.com.br/account/balance',
      headers: {
        'Authorization': 'Bearer $token', // passa o token no header
      },
    );
    print(result.body);
    if (result.statusCode == 200) {
      return SecondPageModel.fromMap(result.body);
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
