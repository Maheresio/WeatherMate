import '../../../../core/utils/api_service.dart';
import '../models/weather_model/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeather(String city);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final ApiService apiService;

  WeatherRemoteDataSourceImpl(this.apiService);

  @override
  Future<WeatherModel> getWeather(String city) async {
    final response =
        await apiService.get(endpoint: 'forecast.json', q: '$city&days=7');

    return WeatherModel.fromJson(response);
  }
}
