part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {
  
}

class HomeProductWishlistButtonClickEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeProductWishlistButtonClickEvent({required this.clickedProduct});

}

class HomeProductCartButtonClickEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeProductCartButtonClickEvent({required this.clickedProduct});

}

class HomeWishlistButtonNavigateEvent extends HomeEvent {

}

class HomeCartButtonNavigateEvent extends HomeEvent {
  
}
