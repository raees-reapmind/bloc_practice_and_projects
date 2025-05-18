part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeProductWishlistButtonClickEvent extends HomeEvent {

}

class HomeProductCartButtonClickEvent extends HomeEvent {

}

class HomeWishlistButtonNavigateEvent extends HomeEvent {

}

class HomeCartButtonNavigateEvent extends HomeEvent {
  
}
