import 'package:bloc/bloc.dart';
import 'package:canarry_app1/data/model/response/burung_semua_tersedia_model.dart';
import 'package:meta/meta.dart';

part 'get_burung_tersedia_event.dart';
part 'get_burung_tersedia_state.dart';

class GetBurungTersediaBloc extends Bloc<GetBurungTersediaEvent, GetBurungTersediaState> {
  GetBurungTersediaBloc() : super(GetBurungTersediaInitial()) {
    on<GetBurungTersediaEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
