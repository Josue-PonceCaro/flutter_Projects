import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:testingsingleton/data/fruit.dart';

@immutable
class FruitEvent extends Equatable {
  FruitEvent();
  @override
  List<Object> get props => [];
}

class LoadFruits extends FruitEvent {}

class AddRandomFruit extends FruitEvent {}

class UpdateWithRandomFruit extends FruitEvent {
  final Fruit updatedFruit;

  UpdateWithRandomFruit(this.updatedFruit) ;
}

class DeleteFruit extends FruitEvent {
  final Fruit fruit;

  DeleteFruit(this.fruit);
}