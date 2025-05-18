part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistActionState extends WishlistState {}
 

class WishlistLoadingState extends WishlistState {}

class WishlistSuccessState extends WishlistState {
  final List<ProductDataModel> WishlistItems;

  WishlistSuccessState({required this.WishlistItems});
}


class WishlistItemRemovedActionState extends WishlistActionState {}


