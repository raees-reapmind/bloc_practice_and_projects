part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}



class WishListInitialEvent extends WishlistEvent {

}

class WishListRemoveFromWishListEvent extends WishlistEvent {
  final ProductDataModel clickedProduct;

  WishListRemoveFromWishListEvent({required this.clickedProduct});

}