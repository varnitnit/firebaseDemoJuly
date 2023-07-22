import 'package:equatable/equatable.dart';

abstract class ProductsEvent extends Equatable{
  const ProductsEvent();
  @override
  /// The list of properties that will be used to determine whether
  /// two instances are equal.
List<Object> get props => [];
}
class ProductsLoadedEvent extends ProductsEvent {

}
