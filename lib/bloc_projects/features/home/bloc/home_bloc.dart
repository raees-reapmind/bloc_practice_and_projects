import 'dart:async';

import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:state_management_practice/bloc_projects/data/cart_items.dart';
import 'package:state_management_practice/bloc_projects/data/grocery_data.dart';
import 'package:state_management_practice/bloc_projects/data/wishlist_items.dart';
import 'dart:developer' as dev;

import 'package:state_management_practice/bloc_projects/features/home/models/home_product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent> (homeInitialEvent);
    on<HomeProductWishlistButtonClickEvent>(homeProductWishlistButtonClickEvent);
    on<HomeProductCartButtonClickEvent>(homeProductCartButtonClickEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
   
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async { 
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(products: GroceryData.groceryProducts.map((e) => 
        ProductDataModel(
          id: e['id'],
           name: e['name'],
            description: e['description'],
             price: e['price'],
              imageUrl: e['imageUrl'])).toList()
              ));
  }

  FutureOr<void> homeProductWishlistButtonClickEvent(HomeProductWishlistButtonClickEvent event, Emitter<HomeState> emit) {
    dev.log('wishlist product clicked---');
    wishListItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickEvent(HomeProductCartButtonClickEvent event, Emitter<HomeState> emit) {
    dev.log('cart product clicked---');
    cartItems.add(event.clickedProduct); 
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    dev.log('wishlist navigate clicked---');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    dev.log('cart navigate clicked---');
    emit(HomeNavigateToCartPageActionState());
  }

}
