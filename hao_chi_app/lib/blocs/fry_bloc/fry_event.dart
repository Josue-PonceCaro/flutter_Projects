part of 'fry_bloc.dart';

abstract class FryEvent extends Equatable {
  const FryEvent();

  @override
  List<Object> get props => [];
}

class StartFryingEvent extends FryEvent{
  final int fryer;
  const StartFryingEvent(this.fryer);
}

class RestartFryingEvent extends FryEvent{
  final int fryer;
  const RestartFryingEvent(this.fryer);
}

class EndFryingEvent extends FryEvent{
  final int fryer;
  const EndFryingEvent(this.fryer);
}

class SetStateFryingEvent extends FryEvent{
  final int fryer;
  const SetStateFryingEvent(this.fryer);
}

