import 'package:chopper/chopper.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: "/cities")
abstract class ApiService extends ChopperService {
  @Get()
  Future<Response> getCities();

  @Get(path: "?City_like={city}")
  Future<Response> getCity(@Path('city') String city);

  static ApiService cretae() {
    final client = ChopperClient(
      baseUrl: "https://indian-cities-api-nocbegfhqg.now.sh",
      services: [
        _$ApiService(),
      ],
      converter: JsonConverter(),
    );
    return _$ApiService(client);
  }
}
