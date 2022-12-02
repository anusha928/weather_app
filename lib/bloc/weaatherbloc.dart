

// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:weather_app/cubit/commonevent.dart';
// import 'package:weather_app/cubit/commonstate.dart';
// import 'package:weather_app/resources/weather_repository.dart';

// class WeatherBloc extends Bloc<CommomEvent, CommonState> {
//   final WeatherRepository weatherRepository;
//   WeatherBloc({required this.weatherRepository}) : super(Commoninitial()) {
//     on<CommonDataFetcheEvent>((event, emit) async {
//       emit(Commonloading());
//       final res = await weatherRepository.fetchdata(location: event.location);
//        if (res.status && res.data != null){
//         emit(CommonDatafetch(items: res.data!));

//        }
//          else {
//         emit(Commonerror(message: res.message));
//       }
//     });
//   }
// }
