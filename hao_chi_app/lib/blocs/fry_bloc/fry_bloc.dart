import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'fry_event.dart';
part 'fry_state.dart';

class FryBloc extends Bloc<FryEvent, FryState> {
  FryBloc() : super(FryState()) {
    on<StartFryingEvent>((event, emit) {
      List<bool> newIsState = [...state.isFrying];
      newIsState[event.fryer] = true;
      print(newIsState);
      emit(state.copyWith(isFrying: newIsState));
    });
    on<EndFryingEvent>((event, emit) {
      List<bool> newIsState = [...state.isFrying];
      newIsState[event.fryer] = false;
      print(newIsState);
      emit(state.copyWith(isFrying: newIsState));
    });
  }
}
