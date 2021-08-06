import 'package:dio/dio.dart';
import 'package:tandamos_api_integration/model/configuration_tanda_model.dart';
import 'package:tandamos_api_integration/model/response_model.dart';
import 'package:tandamos_api_integration/model/user_data_model.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = 'https://api-qa.tandamos.com/v1/';

  Future<UserData> getUserData() async {
    try {
      Response response = await _dio.post('${_baseUrl}auth/login', data: {
        'email': 'app_user_tandamos@tandamos.com',
        'password': 'T4nd4m054ppu53r#.',
      });
      ResponseModel responseModel = ResponseModel.fromJson(response.data);
      UserData userData = UserData.fromJson(responseModel.data.first);
      return userData;
    } on DioError catch (e) {
      // Something happened in setting up or sending the request that triggered an Error
      print(e.message);
      throw Error();
    }
  }

  Future<ConfigurationTanda> getConfigurationTada(String token) async {
    try {
      Response response = await _dio.post('${_baseUrl}configuration-tanda',
          data: {
            'email': 'null',
          },
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));
      ResponseModel responseModel = ResponseModel.fromJson(response.data);
      ConfigurationTanda configurationTanda =
          ConfigurationTanda.fromJson(responseModel.data.first);
      // We can print any ConfigurationTanda property
      print(configurationTanda.frequency.first.name);
      return configurationTanda;
    } on DioError catch (e) {
      print(e.message);
      throw Error();
    }
  }
}
