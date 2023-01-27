import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:testingsingleton/data/fruit.dart';

abstract class FruitState extends Equatable {
  final List<Fruit> fruits;
  final bool isLoading;
  const FruitState({
    fruits,
    this.isLoading = false
    }): this.fruits : fruits ?? const [];
  @override
  List<Object> get props => [fruits];
}

