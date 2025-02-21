import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entity/weather_entity.dart';
import '../../../domain/usecases/get_weather_usecase.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.getWeatherUsecase) : super(WeatherInitial());

  final GetWeatherUsecase getWeatherUsecase;

  void getWeather(dynamic position) async {
    emit(WeatherLoading());
    final result = await getWeatherUsecase.execute(position);
    result.fold(
      (failure) => emit(WeatherFailed(message: failure.message)),
      (weather) => emit(WeatherSuccess(weather: weather)),
    );
  }
}
