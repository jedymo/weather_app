import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/data/model/weather.dart';
import 'package:weather_app/data/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repository;

  WeatherBloc(this.repository) : super(const WeatherInitial()) {
    // on<WeatherEvent>((event, emit) {
    //   event.
    // });
    on<GetWeather>((event, emit) async {
      try {
        final weather = await repository.fetchWeather(event.cityName);
        emit(WeatherLoaded(weather));
      } on NetworkError {
        emit(const WeatherError(
          "Couldn't fetch weather. Is the device online?",
        ));
      }
    });

    on<GetDetailedWeather>((event, emit) async {
      try {
        final weather = await repository.fetchDetailedWeather(event.cityName);
        emit(WeatherLoaded(weather));
      } on NetworkError {
        emit(const WeatherError(
          "Couldn't fetch weather. Is the device online?",
        ));
      }
    });
  }
}
