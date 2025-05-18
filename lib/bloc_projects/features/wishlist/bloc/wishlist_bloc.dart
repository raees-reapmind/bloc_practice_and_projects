import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:state_management_practice/bloc_projects/data/wishlist_items.dart';

import '../../home/models/home_product_data_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistEvent>((event, emit) { 
    });
    on<WishListInitialEvent>(wishListInitialEvent);
    on<WishListRemoveFromWishListEvent>(wishListRemoveFromWishListEvent);
  }

  FutureOr<void> wishListInitialEvent(WishListInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistLoadingState());
    emit(WishlistSuccessState(WishlistItems: wishListItems));
  }

  FutureOr<void> wishListRemoveFromWishListEvent(WishListRemoveFromWishListEvent event, Emitter<WishlistState> emit) {
    wishListItems.remove(event.clickedProduct);
    emit(WishlistSuccessState(WishlistItems: wishListItems));
    emit(WishlistItemRemovedActionState());
  }
}
