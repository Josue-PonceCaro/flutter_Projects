part of 'fry_bloc.dart';

class FryState extends Equatable {
  final int numFryer;
  final List<bool> isFrying;
  final List<DateTime> initTimeFrying;
  final List<int> stateFrying;

  FryState( {
     this.numFryer = 2,
     isFrying, 
     initTimeFrying,
     stateFrying,
  }): isFrying = isFrying ?? [false,false,false,false], 
    stateFrying = stateFrying ?? [0,0,0,0],
    initTimeFrying = initTimeFrying ?? [DateTime.now(), DateTime.now(), DateTime.now(), DateTime.now()] ;
  FryState copyWith({
     int? numFryer,
     List<bool>? isFrying,
     List<DateTime>? initTimeFrying,
     List<int>? stateFrying,
  }) => FryState(
    numFryer      : numFryer      ?? this.numFryer, 
    isFrying      : isFrying      ?? this.isFrying,
    initTimeFrying: initTimeFrying?? this.initTimeFrying,
    stateFrying   : stateFrying   ?? this.stateFrying 
  );
  @override
  // TODO: implement props
  List<Object?> get props => [
    numFryer,
    isFrying,
    initTimeFrying,
    stateFrying,
  ];

}

