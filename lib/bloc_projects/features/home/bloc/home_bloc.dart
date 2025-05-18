import 'dart:async';

import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'dart:developer' as dev;

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeProductWishlistButtonClickEvent>(homeProductWishlistButtonClickEvent);
    on<HomeProductCartButtonClickEvent>(homeProductCartButtonClickEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
   
  }

  FutureOr<void> homeProductWishlistButtonClickEvent(HomeProductWishlistButtonClickEvent event, Emitter<HomeState> emit) {
    dev.log('wishlist product clicked---');
  }

  FutureOr<void> homeProductCartButtonClickEvent(HomeProductCartButtonClickEvent event, Emitter<HomeState> emit) {
    dev.log('cart product clicked---');
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
